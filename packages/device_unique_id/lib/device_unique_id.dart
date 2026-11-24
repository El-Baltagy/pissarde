import 'package:flutter/services.dart';

/// Provides a reinstall-persistent unique device identifier on Android and iOS.
abstract class DeviceUniqueId {
  static const MethodChannel _channel = MethodChannel('device_unique_id');

  /// Returns a persistent device identifier from the host platform, or `null`
  /// if unavailable.
  static Future<String?> getDeviceId() async {
    return _channel.invokeMethod<String>('getDeviceId');
  }
}
