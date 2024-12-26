import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:btc_price_app/domain/model/price_response.dart';

part 'price_api_client.g.dart';

@RestApi()
abstract class PriceApiClient {
  factory PriceApiClient(Dio dio, {String baseUrl}) = _PriceApiClient;

  @GET('/prices/krw')
  Future<PriceResponse> getKrwPrice();

  @GET('/prices/usd')
  Future<PriceResponse> getUsdPrice();
}
