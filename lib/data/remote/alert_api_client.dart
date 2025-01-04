import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../../domain/model/alert/alert_model.dart';
import '../../domain/model/auth/auth_model.dart';

part 'alert_api_client.g.dart';

@RestApi()
abstract class AlertApiClient {
  factory AlertApiClient(Dio dio, {String baseUrl}) = _AlertApiClient;

  @POST('/alerts/condition')
  Future<AlertResponse> createAlert(@Body() AlertRequest request);

  @GET('/alerts')
  Future<List<AlertResponse>> getAlerts();

  @DELETE('/alerts/{alertId}')
  Future<MessageResponse> deleteAlert(@Path('alertId') int alertId);

  // @PUT('/alerts/{id}/reactivate')
  // Future<AlertResponse> reactivateAlert(@Path('id') int id);

  @PATCH('/alerts/{id}/toggle')
  Future<AlertToggleResponse> toggleAlert(@Path('id') int id);
}
