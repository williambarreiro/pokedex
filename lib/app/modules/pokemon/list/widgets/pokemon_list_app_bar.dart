import 'package:flutter/material.dart';
import 'package:pokedex/app/core/ui/extensions/screen_size_extension.dart';

class PokemonListAppBar extends StatelessWidget {
  final String title;
  const PokemonListAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(top: 16.h, bottom: 10.h, left: 16.w),
        child: Row(
          children: [
            Image.asset(
              'assets/images/pokeball.png',
              fit: BoxFit.contain,
              height: 24.h,
            ),
            SizedBox(width: 16.w),
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24.sp,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
