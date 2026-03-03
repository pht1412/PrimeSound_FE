import 'package:flutter/material.dart';

import '../../core/app_export.dart';
import '../../widgets/home/custom_bottom_bar.dart';
import './bloc/music_home_bloc.dart';
import './models/music_home_model.dart';
import './music_home_initial_page.dart';

class MusicHomeScreen extends StatelessWidget {
  MusicHomeScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<MusicHomeBloc>(
      create: (context) =>
          MusicHomeBloc(MusicHomeState(musicHomeModelObj: MusicHomeModel()))
            ..add(MusicHomeInitialEvent()),
      child: MusicHomeScreen(),
    );
  }

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Navigator(
          key: navigatorKey,
          initialRoute: AppRoutes.musicHomeScreenInitialPage,
          onGenerateRoute: (routeSetting) => PageRouteBuilder(
            pageBuilder: (ctx, a1, a2) =>
                getCurrentPage(context, routeSetting.name!),
            transitionDuration: Duration(seconds: 0),
          ),
        ),
        bottomNavigationBar: SizedBox(
          width: double.maxFinite,
          child: _buildBottomNavigation(context),
        ),
      ),
    );
  }

  Widget _buildBottomNavigation(BuildContext context) {
    return CustomBottomBar(
      bottomBarItemList: [
        CustomBottomBarItem(
          icon: ImageConstant.imgIconTabHome,
          activeIcon: ImageConstant.imgIconTabHomeFill,
          routeName: AppRoutes.musicHomeScreenInitialPage,
        ),
        CustomBottomBarItem(
          icon: ImageConstant.imgSearch,
          activeIcon: ImageConstant.imgSearch,
          routeName: '/search',
        ),
        CustomBottomBarItem(
          icon: ImageConstant.imgClarityLibrarySolid,
          activeIcon: ImageConstant.imgClarityLibrarySolid,
          routeName: '/library',
        ),
        CustomBottomBarItem(
          icon: ImageConstant.imgIconPerson,
          activeIcon: ImageConstant.imgIconPerson,
          routeName: '/profile',
        ),
      ],
      selectedIndex: 0,
      onChanged: (index) {
        var routes = [
          AppRoutes.musicHomeScreenInitialPage,
          '/search',
          '/library',
          '/profile',
        ];
        navigatorKey.currentState?.pushNamed(routes[index]);
      },
      backgroundColor: appTheme.black_900,
      enableShadow: true,
    );
  }

  Widget getCurrentPage(BuildContext context, String currentRoute) {
    switch (currentRoute) {
      case AppRoutes.musicHomeScreenInitialPage:
        return MusicHomeInitialPage.builder(context);
      default:
        return Container();
    }
  }
}
