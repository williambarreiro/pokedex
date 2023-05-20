import 'package:flutter_modular/flutter_modular.dart';

import '../../repositories/pokemon/pokemon_repository_impl.dart';
import '../../services/pokemon/pokemon_service_impl.dart';
import 'details/pokemon_details_module.dart';
import 'list/pokemon_list_module.dart';

class PokemonModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.lazySingleton((i) => PokemonRepositoryImpl(i())),
        Bind.lazySingleton((i) => PokemonServiceImpl(i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute('/list', module: PokemonListModule()),
        ModuleRoute('/details', module: PokemonDetailsModule()),
      ];
}
