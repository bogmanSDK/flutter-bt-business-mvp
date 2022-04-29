import 'dart:async';

import 'package:bt_business/data/data_source/login/models/request/login_request.dart';
import 'package:bt_business/domain/use_cases/auth_page_usecases.dart';
import 'package:configuration/data/exceptions/api_exception.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthUseCases authUseCases;

  AuthCubit({
    required this.authUseCases,
  }) : super(Initial());

  FutureOr<void> loginUser(String? param) async {
    try {
      final res = await authUseCases.loginUser(
        LoginRequest.fromJson(
          {'test': param},
        ),
      );
      emit(LoginUserSuccess(res.test ?? ''));
    } on ApiException catch (_) {
      emit(LoginUserError());
    } catch (_) {
      emit(LoginUserError());
    }
  }
}
