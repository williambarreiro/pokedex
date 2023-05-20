import 'package:flutter_modular/flutter_modular.dart';

import 'controller/pokemon_details_controller.dart';
import 'pokemon_details_page.dart';

class PokemonDetailsModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.lazySingleton((i) => PokemonDetailsController(i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (_, args) => PokemonDetailsPage(
            controller: Modular.get()..loadPokemon(args.data),
          ),
        ),
      ];
}
