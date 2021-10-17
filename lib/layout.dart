import 'package:provider/provider.dart';

import 'components/top_nav.dart';
import 'core/provider/theme_provider.dart';
import 'helpers/local_navigator.dart';

import 'components/large_screen.dart';
import 'components/side_menu.dart';
import 'helpers/responsiveness.dart';
import 'package:flutter/material.dart';

class SiteLayout extends StatelessWidget {
  SiteLayout({Key? key}) : super(key: key);
  final GlobalKey<ScaffoldState>? scaffoldKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context, listen: true);
    return Scaffold(
      backgroundColor: themeProvider.isDarkMode
          ? const Color(0xFF212936).withOpacity(0.9)
          : Colors.white,
      key: scaffoldKey,
      extendBodyBehindAppBar: true,
      appBar: ResponsiveWidget.isSmallScreen(context)
          ? topNavigationBar(context, scaffoldKey)
          : null,
      drawer: ResponsiveWidget.isSmallScreen(context)
          ? const Drawer(
              child: SideMenu(),
            )
          : null,
      body: ResponsiveWidget(
        largeScreen: const LargeScreen(),
        smallScreen: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: localNavigator(),
        ),
      ),
    );
  }
}
