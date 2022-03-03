
import 'package:bt_business/data/data_sources/local/user/user_local_source.dart';
import 'package:bt_business/data/data_sources/remote/user/user_api.dart';
import 'package:bt_business/domain/repositories/auth/authentication_repository.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  @override
  UserLocalSource userLocalSource;
  @override
  UserRemoteApi userRemoteSource;

  AuthenticationRepositoryImpl(
    this.userLocalSource,
    this.userRemoteSource,
  );
}
