import 'package:flutter/material.dart';
import 'package:pokedex/app/core/helpers/string_utils.dart';
import 'package:pokedex/app/core/ui/extensions/screen_size_extension.dart';

import '../../../../models/pokemon_basic_model.dart';

class PokemonCard extends StatelessWidget {
  final PokemonBasicModel pokemon;
  final void Function()? onTap;

  const PokemonCard({
    super.key,
    required this.pokemon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 108.h,
      width: 104.w,
      child: InkWell(
        onTap: onTap,
        child: Stack(
          children: [
            Positioned(child: _buildBackground()),
            Positioned(child: _buildUpperLayer()),
          ],
        ),
      ),
    );
  }

  Widget _buildBackground() {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.sp),
      ),
      color: Colors.white,
      elevation: 2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            height: 44.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(8.sp)),
              color: const Color(0xFFEFEFEF),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUpperLayer() {
    return SizedBox(
      width: double.infinity,
      height: 108.h,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 6.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                StringUtils.formatId(pokemon.id),
                style: TextStyle(
                  fontSize: 12.sp,
                  color: const Color(0xFF666666),
                ),
              ),
              SizedBox(width: 12.w),
            ],
          ),
          SizedBox(
            width: 64.w,
            child: pokemon.sprite.isNotEmpty
                ? Image.network(
                    pokemon.sprite,
                    fit: BoxFit.contain,
                  )
                : Container(),
          ),
          Text(
            pokemon.name,
            style: TextStyle(fontSize: 12.sp),
          ),
          SizedBox(height: 4.h),
        ],
      ),
    );
  }
}
