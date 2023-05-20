import 'package:flutter/material.dart';
import 'package:pokedex/app/modules/pokemon/details/controller/pokemon_details_controller.dart';

class PokemonDetailsPage extends StatelessWidget {
  final PokemonDetailsController controller;

  const PokemonDetailsPage({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: Container(),
    );
  }
}
