import 'dart:async';

import 'package:bt_business/data/data_source/login/models/request/login_request.dart';
import 'package:bt_business/data/data_source/login/models/response/login_response.dart';
import 'package:bt_business/data/data_source/login/repositories/auth_repository.dart';
import 'package:bt_business/data/data_source/login/repositories/impl/auth_repo.dart';

class AuthUseCases {
  final AuthRepository authRepository;

  AuthUseCases(this.authRepository);

  FutureOr<LoginResponse> loginUser(LoginRequest? request) => authRepository.loginUser(request);
}
