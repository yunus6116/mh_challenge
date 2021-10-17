import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

import 'package:get/get.dart';
import 'core/provider/user_list_provider.dart';
import 'package:provider/provider.dart';
import 'core/theme/light_theme.dart';
import 'layout.dart';
import 'pages/404/error_page.dart';
import 'routing/routes.dart';
import 'core/provider/theme_provider.dart';
import 'controllers/menu_controller.dart';
import 'core/theme/dark_theme.dart';
import 'controllers/navigation_controller.dart';

void main() {
  setUrlStrategy(PathUrlStrategy());
  Get.put(MenuController());
  Get.put(NavigationController());

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<ThemeProvider>(
        create: (_) => ThemeProvider(getLightTheme()),
      ),
      ChangeNotifierProvider<UserListModel>(
        create: (_) => UserListModel(),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context, listen: true);
    return GetMaterialApp(
      initialRoute: dashboardPageRoute,
      unknownRoute: GetPage(
        name: '/not-found',
        page: () => const PageNotFound(),
        transition: Transition.fadeIn,
      ),
      getPages: [
        GetPage(name: rootRoute, page: () => SiteLayout()),
      ],
      debugShowCheckedModeBanner: false,
      title: 'Dash',
      themeMode: themeProvider.themeMode,
      theme: getLightTheme(),
      darkTheme: getDarkTheme(),
    );
  }
}
