import 'dart:convert';

import 'package:http/http.dart' as http;

class PokemonSevice {
  final headers = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
  };

  String baseUrl = "https://pokeapi.co/api/v2/pokemon/";

  getAllPokemon() async {
    var fullURL = Uri.parse(baseUrl);
    return await http.get(fullURL);
  }

  getPokeAbility(name) async {
    var fullURL = Uri.parse(baseUrl + "$name");
    return await http.get(fullURL);
  }
}
