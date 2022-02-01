import 'package:flutter/material.dart';

class NavigationDrawerWidget extends StatelessWidget {
  const NavigationDrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.lightBlue[100],
        child: ListView(
          children: [drawerItem(text: "Information", icon: Icons.info_rounded)],
        ),
      ),
    );
  }

  Widget drawerItem({required String text, required IconData icon}) {
    return ListTile(
      title: Text('$text'),
      leading: Icon(icon),
    );
  }
}
