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

class AuthResponse {
  final String accessToken;
  final String tokenType;

  AuthResponse({
    required this.accessToken,
    required this.tokenType,
  });

  factory AuthResponse.fromJson(Map<String, dynamic> json) {
    return AuthResponse(
      accessToken: json['access_token'],
      tokenType: json['token_type'],
    );
  }
}

class MessageResponse {
  final String message;

  MessageResponse({required this.message});

  factory MessageResponse.fromJson(Map<String, dynamic> json) {
    return MessageResponse(message: json['message']);
  }
}
