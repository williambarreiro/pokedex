import 'package:flutter_modular/flutter_modular.dart';

import 'pokemon_list_page.dart';

class PokemonListModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes =>
      [ChildRoute('/', child: (_, __) => const PokemonListPage())];
}
