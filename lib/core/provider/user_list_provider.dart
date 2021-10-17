import 'package:flutter/foundation.dart';
import '../../model/user_model.dart';

class UserListModel extends ChangeNotifier {
  final List<UserModel> users = [
    UserModel(
      username: 'Nicci Troiani',
      location: 'Chicago, IL',
      assetName: 'assets/profiles/profile1.png',
    ),
    UserModel(
      username: 'George Fields',
      location: 'New York, Ny',
      assetName: 'assets/profiles/profile2.png',
    ),
    UserModel(
      username: 'Jones Dermot',
      location: 'San Francico, CA',
      assetName: 'assets/profiles/profile3.png',
    ),
    UserModel(
      username: 'Jane Doe',
      location: 'New York, NY',
      assetName: 'assets/profiles/profile4.png',
    ),
  ];

  void deleteUser(int index) {
    users.removeAt(index);
    notifyListeners();
  }

  void changeUsername(int index, String userName) {
    users.elementAt(index).username = userName;
    notifyListeners();
  }
}
