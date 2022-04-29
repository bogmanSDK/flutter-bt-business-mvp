import 'package:bt_business/domain/use_cases/auth_page_usecases.dart';
import 'package:bt_business/presentation/bloc/auth/auth_cubit.dart';
import 'package:configuration/di/di_module.dart';

class BlocModule extends DIModule {
  @override
  provides() async {
    getIt.registerSingleton(AuthCubit(authUseCases: AuthUseCases(getIt.get())));
  }
}
