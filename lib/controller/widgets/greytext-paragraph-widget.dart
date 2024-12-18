import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/app-colors/app-colors.dart';

class GreyTextParagraph extends StatelessWidget {
  String text;
  GreyTextParagraph({super.key , required this.text});

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Center(

        child: Text (text , textAlign: TextAlign.center, style: GoogleFonts.poppins(

          color: AppColors.greyishColor,
          fontSize: 14,
          fontWeight: FontWeight.w300,
        ), ),

      ),
    );
  }
}
