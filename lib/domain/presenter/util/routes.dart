import 'package:flutter/material.dart';
import 'package:my_reqres_login/domain/presenter/home/home_page.dart';
import 'package:my_reqres_login/domain/presenter/home/model/home_page_argument.dart';
import 'package:my_reqres_login/domain/presenter/login/login_page.dart';

class Routes {
  static const login = "/login";
  static const home = "/home";
}

Route<dynamic>? generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case Routes.login:
      return MaterialPageRoute(builder: (_) => LoginPage());
    case Routes.home:
      final args = routeSettings.arguments as HomePageArgument;

      return MaterialPageRoute(builder: (ctx) => HomePage(argument: args));
  }
  return null;
}
