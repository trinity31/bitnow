import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../../domain/model/credit_response.dart';
import '../../domain/model/auth/auth_model.dart';

part 'credit_api_client.g.dart';

@RestApi()
abstract class CreditApiClient {
  factory CreditApiClient(Dio dio, {String baseUrl}) = _CreditApiClient;

  @GET('/credits/balance')
  Future<CreditResponse> getBalance();

  @POST('/credits/earn/ad-view')
  Future<MessageResponse> earnCreditFromAd();
}
