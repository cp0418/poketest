import 'package:flutter/material.dart';
import 'package:flutter_exam_pokedex/poke_detail.dart';
import 'package:flutter_exam_pokedex/poke_screen.dart';

final Map<String, WidgetBuilder> routes = {
  "/": (BuildContext context) => PokeScreen(),
  "/detail": (BuildContext context) => PokeDetail(),
};
