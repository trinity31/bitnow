import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_model.freezed.dart';
part 'auth_model.g.dart';

class AuthRequest {
  final String email;
  final String password;
  final String? fcmToken;

  AuthRequest({
    required this.email,
    required this.password,
    this.fcmToken,
  });

  Map<String, dynamic> toJson() => {
        'email': email,
        'password': password,
        if (fcmToken != null) 'fcm_token': fcmToken,
      };
}

@freezed
class UserResponse with _$UserResponse {
  factory UserResponse({
    int? id,
    String? email,
    @JsonKey(name: 'fcm_token') String? fcmToken,
    @JsonKey(name: 'is_admin') bool? isAdmin,
  }) = _UserResponse;

  factory UserResponse.fromJson(Map<String, dynamic> json) =>
      _$UserResponseFromJson(json);
}

@freezed
class AuthResponse with _$AuthResponse {
  factory AuthResponse({
    @JsonKey(name: 'access_token') String? accessToken,
    @JsonKey(name: 'token_type') String? tokenType,
    UserResponse? user,
  }) = _AuthResponse;

  factory AuthResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthResponseFromJson(json);
}

class MessageResponse {
  final String message;

  MessageResponse({required this.message});

  factory MessageResponse.fromJson(Map<String, dynamic> json) {
    return MessageResponse(message: json['message']);
  }
}
