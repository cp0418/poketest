import 'package:flutter/material.dart';
import 'package:flutter_exam_pokedex/screens/Layout/pos_home_screen.dart';
import 'package:flutter_exam_pokedex/screens/bluetooth_screen.dart';
import 'package:flutter_exam_pokedex/screens/home_screen.dart';
import 'package:flutter_exam_pokedex/screens/pos_screen.dart';
import 'package:flutter_exam_pokedex/screens/product_screen.dart';
import 'package:flutter_exam_pokedex/screens/userlist_screen.dart';

final Map<String, WidgetBuilder> routes = {
  "/": (BuildContext context) => HomeScreen(),
  "/poshome": (BuildContext context) => POSHomeScreen(),
  "/pos": (BuildContext context) => POSScreen(),
  "/userlist": (BuildContext context) => UserListScreen(),
  "/product": (BuildContext context) => ProductScreen(),
  "/bluetooth": (BuildContext context) => BluetoothListScreen(),
};
