import 'package:flutter/material.dart';

class CircularContainerLeft extends StatelessWidget {
  const CircularContainerLeft({super.key});

  @override
  Widget build(BuildContext context) {
    return  Positioned(
      top: -5,
      left: -16,
      child: Container(
        height: 180,
        width: 90,
        decoration: BoxDecoration(
            color: Color(0xff6a6395).withOpacity(0.5),
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(200),
                bottomRight: Radius.circular(200))),
      ),
    );
  }
}
