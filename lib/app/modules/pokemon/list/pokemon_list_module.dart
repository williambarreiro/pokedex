import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex/app/modules/pokemon/list/controller/pokemon_list_controller.dart';

import 'pokemon_list_page.dart';

class PokemonListModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.lazySingleton((i) => PokemonListController(i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (_, __) => PokemonListPage(
            controller: Modular.get()..loadPokemons(),
          ),
        ),
      ];
}
