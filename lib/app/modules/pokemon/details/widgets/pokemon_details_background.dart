import 'package:flutter/material.dart';
import 'package:pokedex/app/core/ui/extensions/screen_size_extension.dart';

class PokemonDetailsBackground extends StatelessWidget {
  final Color color;

  const PokemonDetailsBackground({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SafeArea(
            child: Padding(
              padding: EdgeInsets.only(top: 8.h, bottom: 4.h, right: 9.w),
              child: Opacity(
                opacity: 0.2,
                child: Image.asset(
                  'assets/images/pokeball.png',
                  fit: BoxFit.contain,
                  height: 208.h,
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 4.w, vertical: 4.h),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          )
        ],
      ),
    );
  }
}
