import '../model/user_model.dart';

final List<UserModel> userList = [
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

class DynamicList {
  List<String> _list = [];
  DynamicList(this._list);

  List get list => _list;
}
