import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../core/provider/theme_provider.dart';
import 'package:provider/provider.dart';
import 'side_menu_item.dart';
import '../constants/controller.dart';
import '../helpers/responsiveness.dart';
import '../routing/routes.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context, listen: true);
    return Container(
      color: themeProvider.isDarkMode ? const Color(0xFF212936) : Colors.white,
      child: ListView(
        children: [
          if (!ResponsiveWidget.isSmallScreen(context))
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: ClipOval(
                    child: Image.asset("assets/profiles/profile.png"),
                  ),
                ),
                ResponsiveWidget.isMediumScreen(context)
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text(
                            'Jared Parker',
                            style: TextStyle(fontSize: 11),
                          ),
                          Expanded(child: Container()),
                          const IconButton(
                            onPressed: null,
                            icon: Icon(
                              Icons.arrow_drop_down,
                              size: 16,
                            ),
                          ),
                        ],
                      )
                    : Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          children: [
                            const Text(
                              'Jared Parker',
                              style: TextStyle(fontSize: 20),
                            ),
                            Expanded(child: Container()),
                            const IconButton(
                              onPressed: null,
                              icon: Icon(Icons.arrow_drop_down),
                            ),
                          ],
                        ),
                      ),
              ],
            ),
          const Divider(
            color: Color(0xFFE5E5E5),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: sideMenuItems
                .map((item) => Column(
                      children: [
                        SideMenuItem(
                            itemName: item.name,
                            onTap: () {
                              if (item.name == 'Change Theme') {
                                final provider = Provider.of<ThemeProvider>(
                                    context,
                                    listen: false);
                                provider.toggleTheme();
                              } else if (!menuController.isActive(item.name)) {
                                menuController.changeActiveItemTo(item.name);
                                if (ResponsiveWidget.isSmallScreen(context)) {
                                  Get.back();
                                }
                                navigationController.navigateTo(item.route);
                              }
                            }),
                        item.name == 'My Tasks'
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Divider(
                                    color: Color(0xFFE5E5E5),
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.only(left: 16.0, top: 10),
                                    child: Text(
                                      'Change Theme',
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  )
                                ],
                              )
                            : Container(),
                      ],
                    ))
                .toList(),
          )
        ],
      ),
    );
  }
}
