import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex/app/core/ui/extensions/screen_size_extension.dart';

import '../../../../core/helpers/string_utils.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  final int id;

  const CustomAppBar({Key? key, required this.title, required this.id})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding:
            EdgeInsets.only(right: 24.w, left: 12.w, top: 12.h, bottom: 28.h),
        child: Row(
          children: [
            IconButton(
              onPressed: () => Modular.to.pop(),
              icon: Icon(
                Icons.arrow_back_rounded,
                color: Colors.white,
                size: 26.h,
              ),
            ),
            Text(
              StringUtils.capitalizeFirstLetter(title),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24.sp,
                color: Colors.white,
              ),
            ),
            Expanded(child: Container()),
            Text(
              StringUtils.formatId(id),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 12.sp,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
