import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

part 'base_api.g.dart';

@RestApi()
abstract class BaseApi {
  factory BaseApi(Dio dio, {String baseUrl}) = _BaseApi;

  @GET("/api/v3/forceupdate")
  Future<void> forceUpdate();
}
