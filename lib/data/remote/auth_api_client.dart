import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../../domain/model/auth/auth_model.dart';

part 'auth_api_client.g.dart';

@RestApi()
abstract class AuthApiClient {
  factory AuthApiClient(Dio dio, {String baseUrl}) = _AuthApiClient;

  @POST('/auth/register')
  Future<MessageResponse> register(@Body() AuthRequest request);

  @POST('/auth/login/json')
  Future<AuthResponse> login(@Body() AuthRequest request);

  @POST('/auth/logout')
  Future<MessageResponse> logout();

  @DELETE('/auth/me')
  Future<MessageResponse> deleteAccount();
}
