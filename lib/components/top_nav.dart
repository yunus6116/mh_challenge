import 'package:flutter/material.dart';
import '../constants/style.dart';

AppBar topNavigationBar(BuildContext? context, GlobalKey<ScaffoldState>? key) =>
    AppBar(
      elevation: 0,
      title: Container(),
      iconTheme: IconThemeData(color: dark),
      backgroundColor: Colors.transparent,
    );
