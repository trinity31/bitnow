import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:btc_price_app/domain/model/price_response.dart';
import 'package:btc_price_app/core/constants.dart';

part 'price_api_client.g.dart';

@RestApi()
abstract class PriceApiClient {
  factory PriceApiClient(Dio dio, {String baseUrl}) = _PriceApiClient;

  @GET(ApiConstants.krwPriceEndpoint)
  Future<PriceResponse> getKrwPrice();

  @GET(ApiConstants.usdPriceEndpoint)
  Future<PriceResponse> getUsdPrice();
}
