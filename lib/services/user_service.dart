import 'dart:convert';

import 'package:flutter_exam_pokedex/models/product_model.dart';
import 'package:flutter_exam_pokedex/models/users_model.dart';
import 'package:http/http.dart' as http;

class UserService {
  final headers = {
    'Content-type': 'application/json',
    'Accept': 'application/json'
  };

  Future getUserList() async {
    String baseUrl = "https://jsonplaceholder.typicode.com/users";
    final respone = await http.get(Uri.parse(baseUrl), headers: headers);

    return usersFromJson(respone.body);
  }

  Stream getProducts() =>
      Stream.periodic(Duration(seconds: 1)).asyncMap((_) => getAllProduct());

  Future getAllProduct() async {
    final respone = await http.get(Uri.parse("http://localhost:3000/products"),
        headers: headers);
    return carProductFromJson(respone.body);
  }
}
