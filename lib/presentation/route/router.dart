import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:bt_business/presentation/pages/login/login_page.dart';
import 'package:bt_business/presentation/pages/security_check/security_check_page.dart';
import 'package:bt_business/presentation/pages/security_number/security_number_page.dart';
import 'package:bt_business/presentation/route/router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    CustomRoute(
      page: LoginPage,
      initial: true,
      transitionsBuilder: TransitionsBuilders.fadeIn,
    ),
    CustomRoute(
      page: SecurityCheckPage,
      initial: false,
      transitionsBuilder: TransitionsBuilders.slideLeft,
    ),
    CustomRoute(
      page: SecurityNumberPage,
      initial: false,
      transitionsBuilder: TransitionsBuilders.slideLeft,
    ),
  ],
)
class $AppRouter {}

final router = AppRouter();
