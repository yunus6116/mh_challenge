import 'package:flutter/cupertino.dart';

class UserModel {
  String? username;
  final String? location;
  final String? assetName;

  UserModel({
    @required this.username,
    @required this.location,
    @required this.assetName,
  });
}
