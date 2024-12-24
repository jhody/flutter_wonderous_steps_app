
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:yleon/ui/screens/page_not_found/page_not_found.dart';

/// Shared paths / urls used across the app
class ScreenPaths {
  static String splash = '/';
  static String intro = '/welcome';
  static String home = '/home';
  static String settings = '/settings';

}
final appRouter = GoRouter(
  errorPageBuilder: (context, state) => MaterialPage(child: PageNotFound(state.uri.toString())),
  routes:[]
);