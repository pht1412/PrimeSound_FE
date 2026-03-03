import 'package:flutter/material.dart';
import '../presentation/music_home_screen/music_home_screen.dart';

import '../presentation/app_navigation_screen/app_navigation_screen.dart';

class AppRoutes {
  static const String musicHomeScreen = '/music_home_screen';
  static const String musicHomeScreenInitialPage =
      '/music_home_screen_initial_page';

  static const String appNavigationScreen = '/app_navigation_screen';
  static const String initialRoute = '/';

  static Map<String, WidgetBuilder> get routes => {
    musicHomeScreen: MusicHomeScreen.builder,
    appNavigationScreen: AppNavigationScreen.builder,
    initialRoute: AppNavigationScreen.builder,
  };
}
