import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo/controller/constants/app-colors/app-colors.dart';

class NormalTextWidget extends StatelessWidget {
  String text;
  Color textColor;
  NormalTextWidget({super.key, required this.text, required this.textColor});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.poppins(
        fontSize: 15,
        fontWeight: FontWeight.w400,
        color: textColor,
      ),
    );
  }
}
