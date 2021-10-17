import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constants/style.dart';
import '../routing/routes.dart';

class MenuController extends GetxController {
  static MenuController instance = Get.find();
  var activeItem = dashboardPageDisplayName.obs;
  var hoverItem = ''.obs;

  changeActiveItemTo(String itemName) {
    activeItem.value = itemName;
  }

  onHover(String itemName) {
    if (!isActive(itemName)) hoverItem.value = itemName;
  }

  isActive(String itemName) => activeItem.value == itemName;
  isHovering(String itemName) => hoverItem.value == itemName;

  Widget? returnIconFor(String itemName) {
    switch (itemName) {
      case dashboardPageDisplayName:
        return _customIcon(Icons.dashboard, itemName);
      case myTasksPageDisplayName:
        return _customIcon(Icons.assignment, itemName);
      default:
        return _customIcon(Icons.exit_to_app, itemName);
    }
  }

  Widget? _customIcon(IconData icon, String itemName) {
    if (isActive(itemName)) {
      return Icon(
        icon,
        size: 22,
        color: const Color(0xFF2196F3),
      );
    }
    return Icon(icon, color: isHovering(itemName) ? dark : lightGrey);
  }
}
