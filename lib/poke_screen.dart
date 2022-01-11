import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_exam_pokedex/services/pokemon_service.dart';
import 'package:flutter_exam_pokedex/widgets/appbar.dart';

class PokeScreen extends StatefulWidget {
  PokeScreen({Key? key}) : super(key: key);

  @override
  _PokeScreenState createState() => _PokeScreenState();
}

class _PokeScreenState extends State<PokeScreen> {
  String? dropDownSelected;
  var pokemonList, query;
  @override
  void initState() {
    super.initState();
    _getPokemonList();
    print(query);
  }

  Future _getPokemonList() async {
    var response = await PokemonSevice().getAllPokemon();
    var body = jsonDecode(response.body);
    setState(() {
      pokemonList = body['results'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: PokeAppBar(
        appBarTitle: 'Pokemon',
      )),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Container(
          color: Colors.white,
          child: pokemonList == null
              ? Center(child: CircularProgressIndicator())
              : Column(
                  children: [
                    Row(
                      children: [
                        Expanded(flex: 5, child: _buildSearchBox()),
                        Expanded(flex: 1, child: sort())
                      ],
                    ),
                    Expanded(
                      child: Column(
                        children: [pokeListView()],
                      ),
                    )
                  ],
                ),
        ),
      ),
    );
  }

  Widget _buildSearchBox() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: TextFormField(
          style: TextStyle(fontSize: 15, color: Colors.black),
          onChanged: (value) {
            setState(() {
              query = value;
            });
          },
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.search, color: Colors.orange, size: 15),
            hintText: 'Search',
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25.0),
              borderSide: BorderSide(
                color: Colors.blue,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25.0),
              borderSide: BorderSide(
                color: Colors.blue,
                width: 2.0,
              ),
            ),
          )),
    );
  }

  Widget sort() {
    return DropdownButton<String>(
      value: dropDownSelected,
      // icon: const Icon(
      //   Icons.sort,
      //   color: Colors.blue,
      // ),
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      onChanged: (String? newValue) {
        setState(() {
          dropDownSelected = newValue!;
        });
        switch (dropDownSelected) {
          case "None":
            pokemonList = pokemonList;
            break;
          case "A-Z":
            print("a-z");

            break;
          case "Z-A":
            print("a-z");
            break;
        }
      },
      hint: Text("Sort"),
      items: <String>['None', 'A-Z', 'Z-A', 'No']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }

  Widget pokeListView() {
    return Expanded(
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: pokemonList.length,
          itemBuilder: (context, index) {
            var pokemon = pokemonList[index];
            return InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/detail',
                    arguments: {"item": pokemon['name']});
              },
              child: Card(
                  child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Text(
                  "${pokemon['name']}",
                  style: TextStyle(fontSize: 20),
                ),
              )),
            );
          }),
    );
  }
}
