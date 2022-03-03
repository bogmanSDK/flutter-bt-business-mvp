
import 'package:bt_business/data/data_sources/local/user/user_local_source.dart';
import 'package:bt_business/data/data_sources/remote/user/user_api.dart';

abstract class AuthenticationRepository {
  late UserLocalSource userLocalSource;
  late UserRemoteApi userRemoteSource;

  AuthenticationRepository(
    this.userLocalSource,
    this.userRemoteSource,
  );
}
