import 'package:flutter/material.dart';
import 'package:talentz/screens/auth/login_screen.dart';
import 'package:talentz/utils/enums.dart';

import '../screens/home/list_screen.dart';
import '../screens/main_screen.dart';

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const MainScreen());
      case LoginScreen.routeName:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case MainScreen.routeName:
        return MaterialPageRoute(builder: (_) => const MainScreen());
      case ListViewScreen.routeName:
        return MaterialPageRoute(
            builder: (_) => ListViewScreen(searchType: args as SearchType));
      default:
        return MaterialPageRoute(builder: (_) => const MainScreen());
    }
  }
}
