import 'package:flutter/material.dart';

class CircularContainerTop extends StatelessWidget {
  const CircularContainerTop({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: -16,
      left: -28,
      child: Container(
        height: 100,
        width: 200,
        decoration: BoxDecoration(
            color: Color(0xff6a6395).withOpacity(0.5),
            borderRadius: BorderRadius.only(
              //topRight: Radius.circular(200),
              bottomLeft: Radius.circular(220),
              bottomRight: Radius.circular(220),
              //topLeft: Radius.circular(10)
            )),
      ),
    );
  }
}
