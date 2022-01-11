import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_exam_pokedex/services/pokemon_service.dart';
import 'package:flutter_exam_pokedex/widgets/appbar.dart';

class PokeDetail extends StatefulWidget {
  PokeDetail({Key? key}) : super(key: key);

  @override
  _PokeDetailState createState() => _PokeDetailState();
}

class _PokeDetailState extends State<PokeDetail> {
  String? pokeName;
  var pokeDetail, pokeAbilities;

  _getPokeAbilities() async {
    var response = await PokemonSevice().getPokeAbility(pokeName);
    var body = jsonDecode(response.body);
    setState(() {
      pokeDetail = body;
      pokeAbilities = body['abilities'];
    });
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    setState(() {
      pokeName = args['item'];
    });
    _getPokeAbilities();

    return Scaffold(
        appBar: AppBar(
            title: PokeAppBar(
          appBarTitle: '$pokeName',
        )),
        body: GestureDetector(
            onTap: () {
              print("tabbed");
              FocusScope.of(context).unfocus();
            },
            child: pokeAbilities == null
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              child: Text(
                                'Abilities',
                                style: TextStyle(fontSize: 20),
                              ),
                            )
                          ],
                        ),
                        ListView.builder(
                            shrinkWrap: true,
                            itemCount: pokeAbilities.length,
                            itemBuilder: (context, index) {
                              var ability = pokeAbilities[index]['ability'];
                              return Card(
                                  child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                child: Text(
                                  "${ability['name']} ",
                                  style: TextStyle(fontSize: 20),
                                ),
                              ));
                            }),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Container(
                              child: Text(
                                'Game indices',
                                style: TextStyle(fontSize: 20),
                              ),
                            )
                          ],
                        ),
                        Expanded(
                          child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: pokeDetail['moves'].length,
                              itemBuilder: (context, index) {
                                var moves = pokeDetail['moves'][index]['move'];
                                return Card(
                                    child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 10),
                                  child: Text(
                                    "${moves['name']} ",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ));
                              }),
                        ),
                      ],
                    ),
                  )));
  }
}
