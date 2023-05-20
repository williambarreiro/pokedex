import 'package:flutter/material.dart';
import 'package:pokedex/app/core/helpers/string_utils.dart';
import 'package:pokedex/app/core/ui/extensions/screen_size_extension.dart';
import 'package:pokedex/app/core/ui/pokedex_colors.dart';

class PokemonTypesWidget extends StatelessWidget {
  final List<String> types;

  const PokemonTypesWidget({super.key, required this.types});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: _getTypeComponents(),
    );
  }

  List<Widget> _getTypeComponents() {
    final typeComponents = <Widget>[];
    for (int i = 0; i < types.length; i++) {
      final type = types[i];
      typeComponents.add(_typeComponent(type, i != 0));
    }

    return typeComponents;
  }

  Widget _typeComponent(String type, bool hasLeftSeparator) {
    return Container(
      margin: EdgeInsets.only(left: hasLeftSeparator ? 16.w : 0),
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 3.h),
      decoration: BoxDecoration(
        color: PokedexColors.getColorByPokemonType(type),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        StringUtils.capitalizeFirstLetter(type),
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 10.sp,
        ),
      ),
    );
  }
}
