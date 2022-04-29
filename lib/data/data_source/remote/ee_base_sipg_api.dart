import 'package:bt_business/data/data_source/login/models/request/login_request.dart';
import 'package:bt_business/data/data_source/login/models/response/login_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

part 'ee_base_sipg_api.g.dart';

@RestApi()
abstract class EEBaseSIPGApi {
  factory EEBaseSIPGApi(Dio dio, {String baseUrl}) = _EEBaseSIPGApi;

  @GET("/authentication/oauth")
  Future<LoginResponse> loginUser(LoginRequest loginRequest);
}