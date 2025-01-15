class FeedbackRequest {
  final String text;

  FeedbackRequest({
    required String content,
    String? email,
  }) : text = email != null
            ? '피드백:\n$content\n\n회신 이메일: $email'
            : '피드백:\n$content';

  Map<String, dynamic> toJson() => {'text': text};
}

class MessageResponse {
  final String message;

  MessageResponse({required this.message});

  factory MessageResponse.fromJson(Map<String, dynamic> json) {
    return MessageResponse(message: json['message'] as String? ?? 'ok');
  }
}
