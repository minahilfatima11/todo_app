import 'package:flutter/material.dart';

import '../constants/app-colors/app-colors.dart';

class TextFieldWidget extends StatelessWidget {
  String hintText;
  TextEditingController controller;
  TextFieldWidget(
      {super.key, required this.hintText, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10),
      child: Container(
          decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.circular(11),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 12.0),
            child: TextFormField(
              style: TextStyle(
                fontSize: 14,
              ),
              controller: controller,
              decoration: InputDecoration(
                hintText: hintText,
                border: InputBorder.none,
              ),
            ),
          )),
    );
  }
}
