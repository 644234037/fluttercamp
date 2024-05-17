import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/pokemon_models.dart';

class Pokemon extends StatefulWidget {
  const Pokemon({Key? key}) : super(key: key);

  @override
  _PokemonState createState() => _PokemonState();
}

class _PokemonState extends State<Pokemon> {
  List<PokemonModel> pokemons = [];
  @override
  void initState() {
    super.initState();
    getDataPokemon();
  }

  void getDataPokemon() async {
    final response = await Dio().get(
        "https://raw.githubusercontent.com/KhunBaw/testProject/main/pokemon-init-db.json");

    //  debugPrint(response.data);

    //  final dataDecode = jsonDecode(response.data);

    //  pokemon = List <PokemonModel>.from(
    //   dataDecode.map(
    //   (x) => PokemonModel().pokemonFormJson(x),
    //   ),
    //  );

    pokemons = pokemonModelFromJson(response.data);

    setState(() {});

    debugPrint("${pokemons.length}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Pokemon Dex"),
      ),
      body: ListView.builder(
        itemCount: pokemons.length,
        itemBuilder: (context, index) {
          final data = pokemons[index];

          // return Container(
          //   child: Text(
          //     "${data.name}",
          //      style: TextStyle(fontSize:16),
          //   ),
          // );
          return Card(
            child: ListTile(
              title: Text(
                "${data.name}",
                style: const TextStyle(fontSize: 16),
              ),
              leading: Image.network(
                data.img,
                errorBuilder: (context, error, stackTrace) => 
                const Icon(
                  Icons.error,
                  size: 50,
                ),
                loadingBuilder: (context, child, loadingProgress) {
                  if(loadingProgress==null) return child;
                  return const CircularProgressIndicator();
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
