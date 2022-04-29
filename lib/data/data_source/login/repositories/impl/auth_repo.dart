import 'dart:async';

import 'package:bt_business/data/data_source/login/models/request/login_request.dart';
import 'package:bt_business/data/data_source/login/models/response/login_response.dart';
import 'package:bt_business/data/data_source/login/repositories/auth_repository.dart';

extension AuthUser on AuthRepository {
  FutureOr<LoginResponse> loginUser(LoginRequest? request) async {
    if (request == null || request.test == null) {
      throw NullThrownError();
    }
    return LoginResponse.fromJson({'test': 'Response: ${request.test}'});
  }
}
