import 'dart:math';

import 'package:newf/core/constants/app_constant.dart';
import 'package:newf/core/storage/hive_storage.dart';

/// Returns a persistent unique device identifier, generating and caching a
/// random UUID v4 in secure Hive storage on first access.
Future<String> getOrCreateDeviceUniqueId() async {
  final storage = HiveStorage();
  try {
    final existing = storage.readData<String>(
      AppConstant.deviceUniqueIdKeyCash,
      boxName: storage.secBoxName,
    );
    if (existing != null && existing.isNotEmpty) {
      return existing;
    }
  } catch (_) {}

  final newId = _generateUuidV4();
  try {
    await storage.writeData<String>(
      AppConstant.deviceUniqueIdKeyCash,
      newId,
      boxName: storage.secBoxName,
    );
  } catch (_) {}
  return newId;
}

String _generateUuidV4() {
  final random = Random.secure();
  final bytes = List<int>.generate(16, (_) => random.nextInt(256));
  bytes[6] = (bytes[6] & 0x0f) | 0x40;
  bytes[8] = (bytes[8] & 0x3f) | 0x80;

  String hex(int byte) => byte.toRadixString(16).padLeft(2, '0');
  final buffer = StringBuffer();
  for (var i = 0; i < 16; i++) {
    if (i == 4 || i == 6 || i == 8 || i == 10) {
      buffer.write('-');
    }
    buffer.write(hex(bytes[i]));
  }
  return buffer.toString();
}
