import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

part 'ee_base_api.g.dart';

@RestApi()
abstract class EEBaseApi {
  factory EEBaseApi(Dio dio, {String baseUrl}) = _EEBaseApi;
}