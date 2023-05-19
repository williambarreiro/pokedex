import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex/app/core/rest_client/dio/dio_client.dart';
import 'package:pokedex/app/modules/pokemon/pokemon_module.dart';

import 'core/helpers/constants.dart';
import 'core/helpers/environments.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.lazySingleton(
          (i) => Dio(
            BaseOptions(
              baseUrl: Environments.param(Constants.envBaseUrlKey) ?? '',
            ),
          ),
        ),
        Bind.lazySingleton((i) => DioClient(i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute('/pokemon', module: PokemonModule()),
      ];
}
