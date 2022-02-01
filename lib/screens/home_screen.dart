import 'package:flutter/material.dart';
import 'package:flutter_exam_pokedex/screens/navigation_drawer.dart';
import 'package:flutter_exam_pokedex/widgets/appbar.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawerWidget(),
      appBar: AppBar(
        title: CustomAppBar(
          appBarTitle: 'Home',
        ),
      ),
    );
  }
}
