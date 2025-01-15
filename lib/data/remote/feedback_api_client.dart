import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../../domain/model/feedback/feedback_model.dart';

part 'feedback_api_client.g.dart';

@RestApi()
abstract class FeedbackApiClient {
  factory FeedbackApiClient(Dio dio, {String baseUrl}) = _FeedbackApiClient;

  @POST('')
  Future<MessageResponse> sendFeedback(@Body() FeedbackRequest request);
}
