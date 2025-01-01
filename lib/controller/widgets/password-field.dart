import 'package:flutter/material.dart';

import '../constants/app-colors/app-colors.dart';

class PasswordFieldWidget extends StatefulWidget {
  String hintText;
  TextEditingController controller;
  PasswordFieldWidget(
      {super.key, required this.hintText, required this.controller});

  @override
  State<PasswordFieldWidget> createState() => _PasswordFieldWidgetState();
}

class _PasswordFieldWidgetState extends State<PasswordFieldWidget> {
  bool isHide = true;

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
            obscureText: isHide,
            style: TextStyle(fontSize: 14),
            controller: widget.controller,
            decoration: InputDecoration(
              suffixIcon: IconButton(
                onPressed: () => setState(() => isHide = !isHide),
                icon: Icon(isHide ? Icons.visibility_off : Icons.visibility),
              ),
              hintText: widget.hintText,
              border: InputBorder.none,
            ),
          ),
        ),
      ),
    );
  }
}
