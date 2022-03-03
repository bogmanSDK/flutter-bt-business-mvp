// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;

import '../pages/login/login_page.dart' as _i1;
import '../pages/security_check/security_check_page.dart' as _i2;
import '../pages/security_number/security_number_page.dart' as _i3;

class AppRouter extends _i4.RootStackRouter {
  AppRouter([_i5.GlobalKey<_i5.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    LoginRoute.name: (routeData) {
      return _i4.CustomPage<dynamic>(
          routeData: routeData,
          child: _i1.LoginPage(),
          transitionsBuilder: _i4.TransitionsBuilders.fadeIn,
          opaque: true,
          barrierDismissible: false);
    },
    SecurityCheckRoute.name: (routeData) {
      return _i4.CustomPage<dynamic>(
          routeData: routeData,
          child: _i2.SecurityCheckPage(),
          transitionsBuilder: _i4.TransitionsBuilders.slideLeft,
          opaque: true,
          barrierDismissible: false);
    },
    SecurityNumberRoute.name: (routeData) {
      return _i4.CustomPage<dynamic>(
          routeData: routeData,
          child: _i3.SecurityNumberPage(),
          transitionsBuilder: _i4.TransitionsBuilders.slideLeft,
          opaque: true,
          barrierDismissible: false);
    }
  };

  @override
  List<_i4.RouteConfig> get routes => [
        _i4.RouteConfig(LoginRoute.name, path: '/'),
        _i4.RouteConfig(SecurityCheckRoute.name, path: '/security-check-page'),
        _i4.RouteConfig(SecurityNumberRoute.name, path: '/security-number-page')
      ];
}

/// generated route for
/// [_i1.LoginPage]
class LoginRoute extends _i4.PageRouteInfo<void> {
  const LoginRoute() : super(LoginRoute.name, path: '/');

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i2.SecurityCheckPage]
class SecurityCheckRoute extends _i4.PageRouteInfo<void> {
  const SecurityCheckRoute()
      : super(SecurityCheckRoute.name, path: '/security-check-page');

  static const String name = 'SecurityCheckRoute';
}

/// generated route for
/// [_i3.SecurityNumberPage]
class SecurityNumberRoute extends _i4.PageRouteInfo<void> {
  const SecurityNumberRoute()
      : super(SecurityNumberRoute.name, path: '/security-number-page');

  static const String name = 'SecurityNumberRoute';
}
