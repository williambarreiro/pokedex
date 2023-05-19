import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex/app/modules/pokemon/list/pokemon_list_page.dart';

import '../../repositories/pokemon/pokemon_repository_impl.dart';
import '../../services/pokemon/pokemon_service_impl.dart';

class PokemonModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.lazySingleton((i) => PokemonRepositoryImpl(i())),
        Bind.lazySingleton((i) => PokemonServiceImpl(i())),
      ];

  @override
  List<ModularRoute> get routes =>
      [ChildRoute('/list', child: (context, args) => const PokemonListPage())];
}
