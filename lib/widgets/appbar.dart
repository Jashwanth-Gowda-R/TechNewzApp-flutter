import 'package:flutter/material.dart';
import 'package:tech_newz_app/utils/colors.dart';
import 'package:tech_newz_app/utils/text.dart';

class MyAppbar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppbar({Key? key})
      : preferredSize = const Size.fromHeight(50.0),
        super(key: key);

  @override
  final Size preferredSize;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      // actions: const [],
      automaticallyImplyLeading: false,
      backgroundColor: AppColors.black,
      elevation: 0,
      title: SizedBox(
        height: 40,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BoldText(
              text: ' Shani ',
              size: 20,
              color: AppColors.primary,
            ),
            ModifiedText(
              text: 'TechNewz',
              size: 20,
              color: AppColors.lightwhite,
            )
          ],
        ),
      ),
      centerTitle: true,
    );
  }
}
