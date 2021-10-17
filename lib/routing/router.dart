import 'package:flutter/material.dart';
import '../pages/dashboard/dashboard.dart';
import '../pages/tasks/my_tasks.dart';
import 'routes.dart';

Route<dynamic>? generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case dashboardPageRoute:
      return _getPageRoute(DashboardPage());
    case myTasksPageRoute:
      return _getPageRoute(const MyTasksPage());
    default:
      return _getPageRoute(DashboardPage());
  }
}

Route<dynamic>? _getPageRoute(Widget child) {
  return MaterialPageRoute(builder: (context) => child);
}
