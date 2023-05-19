import 'package:flutter/material.dart';
import 'package:pokedex/app/core/ui/screen_size_extension.dart';

import '../../../../models/pokemon_basic_model.dart';

class PokemonCard extends StatelessWidget {
  final PokemonBasicModel pokemon;

  const PokemonCard({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 108.h,
      width: 104.w,
      child: InkWell(
        onTap: () {},
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
    final formattedId = '#${pokemon.id.toString().padLeft(3, '0')}';

    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 6.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                formattedId,
                style: TextStyle(
                  fontSize: 12.sp,
                  color: const Color(0xFF666666),
                ),
              ),
              SizedBox(width: 12.w),
            ],
          ),
          SizedBox(
            height: 64.h,
            width: 64.w,
            child: Image.network(pokemon.sprite),
          ),
          Text(
            pokemon.name,
            style: TextStyle(fontSize: 12.sp),
          ),
          SizedBox(height: 6.h),
        ],
      ),
    );
  }
}
