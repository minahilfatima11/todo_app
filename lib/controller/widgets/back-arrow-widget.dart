import 'package:flutter/material.dart';

import '../constants/app-colors/app-colors.dart';
import '../constants/app-icons/app-icons.dart';

class BackArrowWidget extends StatelessWidget {
  const BackArrowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 0.0, top: 20.0),
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: ImageIcon(
          AssetImage(AppIcons.backArrowIcon),
          size: 80,
          color: AppColors.whiteColor,
        ),
      ),
    );
  }
}
