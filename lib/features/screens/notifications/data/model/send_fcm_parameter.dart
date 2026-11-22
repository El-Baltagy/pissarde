import 'dart:io';

class SendFcmParameter {
  SendFcmParameter({required this.userId, required this.fcmToken});
  final String userId,fcmToken;

    Map<String, dynamic> toJson() => {
      "user_id": userId,
      "token": fcmToken,
      "platform": Platform.isAndroid? "android":"ios",
    };
  }
