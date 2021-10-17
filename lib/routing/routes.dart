const rootRoute = "/";

const dashboardPageDisplayName = 'Dashboard';
const dashboardPageRoute = '/dashboard';

const myTasksPageDisplayName = 'My Tasks';
const myTasksPageRoute = '/drivers';

const changeThemeDisplayName = 'Change Theme';
const changeThemeRoute = '/clients';

class MenuItem {
  final String name;
  final String route;

  MenuItem(this.name, this.route);
}

List<MenuItem> sideMenuItems = [
  MenuItem(dashboardPageDisplayName, dashboardPageRoute),
  MenuItem(myTasksPageDisplayName, myTasksPageRoute),
  MenuItem(changeThemeDisplayName, changeThemeRoute),
];
