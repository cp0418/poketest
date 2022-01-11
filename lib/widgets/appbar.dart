import 'package:flutter/material.dart';

class PokeAppBar extends StatelessWidget {
  PokeAppBar({Key? key, required this.appBarTitle}) : super(key: key);
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
