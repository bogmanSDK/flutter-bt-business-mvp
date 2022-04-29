import 'package:bt_business/data/data_source/login/repositories/auth_repository.dart';
import 'package:configuration/di/di_module.dart';

class RepositoryModule extends DIModule {
  @override
  provides() async {
    getIt.registerFactory<AuthRepository>(
      () => AuthRepository(
        api: getIt.get(),
      ),
    );
  }
}
