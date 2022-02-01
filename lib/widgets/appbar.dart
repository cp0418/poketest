import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  CustomAppBar({Key? key, required this.appBarTitle}) : super(key: key);
  String appBarTitle;

  @override
  Widget build(BuildContext context) {
    return Text(
      "$appBarTitle",
      style: TextStyle(
          fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
    );
  }
}
