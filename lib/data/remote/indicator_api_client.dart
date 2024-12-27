import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:btc_price_app/domain/model/indicator_response.dart';
import 'package:btc_price_app/core/constants.dart';

part 'indicator_api_client.g.dart';

@RestApi()
abstract class IndicatorApiClient {
  factory IndicatorApiClient(Dio dio, {String baseUrl}) = _IndicatorApiClient;

  @GET(ApiConstants.rsiEndpoint)
  Future<RsiResponse> getRsi({
    @Query('interval') String interval = 'all',
    @Query('length') int length = 14,
  });

  @GET(ApiConstants.dominanceEndpoint)
  Future<DominanceResponse> getDominance();

  @GET(ApiConstants.mvrvEndpoint)
  Future<MvrvResponse> getMvrv();
}