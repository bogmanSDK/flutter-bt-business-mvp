import 'dart:async';
import 'package:bt_business/data/data_source/remote/base_api.dart';
import 'package:bt_business/data/data_source/remote/ee_base_api.dart';
import 'package:bt_business/data/data_source/remote/ee_base_sipg_api.dart';
import 'package:configuration/di/di_module.dart';
import 'package:dio/dio.dart';
import 'package:configuration/environment/build_config.dart';
import 'package:configuration/network/interceptor/auth_interceptor.dart';
import 'package:configuration/network/interceptor/data_format_interceptor.dart';

class ApiModule extends DIModule {
  @override
  provides() async {
    // register api
    final dioMain = await setupDio();
    getIt.registerSingleton(dioMain);
    getIt.registerSingleton(BaseApi(dioMain, baseUrl: BuildConfig.get().base));
    getIt.registerSingleton(EEBaseApi(dioMain, baseUrl: BuildConfig.get().eeBase));
    getIt.registerSingleton(EEBaseSIPGApi(dioMain, baseUrl: BuildConfig.get().eeBaseSIPG));
  }

  static FutureOr<Dio> setupDio() async {
    final options = BaseOptions(
      connectTimeout: BuildConfig.get().connectTimeout,
      receiveTimeout: BuildConfig.get().receiveTimeout,
      responseType: ResponseType.json,
      validateStatus: (status) {
        return true;
      },
      //baseUrl: BuildConfig.get().baseUrl,
    );
    final Dio dio = Dio(options);

    /// Unified add authentication request header
    dio.interceptors.add(AuthInterceptor());

    dio.interceptors.add(DataFormatInterceptor());

    /// Print Log (production mode removal)
    if (BuildConfig.get().flavor != Flavor.PRODUCTION) {
      dio.interceptors.add(
        LogInterceptor(
          requestBody: true,
          responseBody: true,
        ),
      );
    }
    return dio;
  }
}
