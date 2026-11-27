import 'dart:convert';

import 'package:newf/core/constants/app_constant.dart';
import 'package:newf/core/storage/hive_storage.dart';
 import 'package:token_saver/secure_token_manager.dart';

import '../../features/screens/login/data/model/login_res/login_res.dart';

// import '../../features/screens/home/data/model/chech_in_res/chech_in_res.dart';

abstract class StorageHelper{
  static Future<void>   deleteUserData   ()async{
  try{
    await HWSecureSaver.delete(AppConstant.tokenKeyCash );
    await  HiveStorage().deleteData(AppConstant.userKeyCash);
  }catch(e){}
  }

  static Future<String?> get getToken async =>await HWSecureSaver.get(AppConstant.tokenKeyCash ) ;
  static  bool  get isLogined   =>HiveStorage().readData(AppConstant.userKeyCash)!=null;
  static User? get userData {
    final data = HiveStorage().readData(AppConstant.userKeyCash);
    if (data == null) return null;

    try {
      // Hive returns maps with `dynamic` keys (`_Map<dynamic, dynamic>`).
      // Normalize through JSON so we get a real `Map<String, dynamic>`,
      // exactly like BaseLocalRepo.readData does.
      final decoded = jsonDecode(jsonEncode(data)) as Map<String, dynamic>;

      final userJson = decoded['data'] is Map
          ? Map<String, dynamic>.from(decoded['data'] as Map)
          : decoded;

      return User.fromJson(userJson);
    } catch (_) {
      return null;
    }
  }
  static bool get isAdmin =>userData?.role.value=='admin';
  static bool get isDutyEmployee=>userData?.role.value=='duty_employee';
  static bool get isAdminOrHrOrSupervisor=>isAdminOrHr||userData?.role.value=='supervisor';
  static bool get isAdminOrHr=>['admin','hr'].contains(userData?.role.value);
  static  bool  get hasViewedOnboarding =>HiveStorage().readData(AppConstant.onboardingKeyCash,
  boxName:  HiveStorage().secBoxName
  )!=null;

}