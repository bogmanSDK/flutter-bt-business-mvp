import 'package:bloc/bloc.dart';
import 'package:bt_business/data/state/authorization/authorization_state.dart';
import 'package:bt_business/domain/repositories/auth/authentication_repository.dart';

class AuthCubit extends Cubit<AuthorizationState> {
  AuthCubit(this._authenticationRepository) : super(AuthorizationStateInit());

  final AuthenticationRepository _authenticationRepository;
}
