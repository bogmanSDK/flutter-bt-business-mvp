import 'package:bt_business/data/data_sources/remote/user/user_api_impl.dart';
import 'package:bt_business/data/repositories/auth/authentication_repository_impl.dart';
import 'package:bt_business/di/user_local_source.dart';
import 'package:bt_business/domain/repositories/auth/authentication_repository.dart';
import 'package:get_it/get_it.dart';

void registerAuthenticationRepository() => GetIt.I.registerSingleton<AuthenticationRepository>(
      AuthenticationRepositoryImpl(
        getUserLocalSource(),
        UserRemoteApiImpl(),
      ),
    );

AuthenticationRepository getAuthenticationRepository() => GetIt.I.get<AuthenticationRepository>();
