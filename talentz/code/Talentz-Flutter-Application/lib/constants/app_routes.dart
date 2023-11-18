
import 'package:flutter/material.dart';
import 'package:talentz/screens/auth/login_screen.dart';

import '../screens/home/home_screen.dart';
import '../screens/home/list_screen.dart';
import '../screens/main_screen.dart';
const String mainRoute = "/mainRoute";
const String homeRoute = "/homeRoute";
const String loginRoute = "/login";
const String listViewRoute = "/listViewRoute";



Map<String, Widget Function(BuildContext)> routes = {
  mainRoute: (context) => const MainScreen(),
  homeRoute: (context) => const HomeScreen(),
  loginRoute: (context) => const LoginScreen(),
  listViewRoute: (context) => const ListViewScreen(),


};
