import 'package:flutter/material.dart';
import '../core/provider/theme_provider.dart';
import 'package:provider/provider.dart';
import 'side_menu.dart';
import '../helpers/local_navigator.dart';

class LargeScreen extends StatelessWidget {
  const LargeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context, listen: true);
    return Row(
      children: [
        const Expanded(
          child: SideMenu(),
        ),
        themeProvider.isDarkMode
            ? Container()
            : const VerticalDivider(
                color: Color(0xFFE5E5E5),
              ),
        Expanded(
          flex: 5,
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 32),
            child: localNavigator(),
          ),
        )
      ],
    );
  }
}
