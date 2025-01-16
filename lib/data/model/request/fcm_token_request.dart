import 'package:freezed_annotation/freezed_annotation.dart';

class FcmTokenRequest {
  final String fcmToken;
  final String? locale;

  FcmTokenRequest({
    required this.fcmToken,
    this.locale,
  });

  Map<String, dynamic> toJson() => {
        'fcm_token': fcmToken,
        if (locale != null) 'locale': locale,
      };
}
