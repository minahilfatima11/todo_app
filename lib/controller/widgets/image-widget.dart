import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  String image;
  ImageWidget({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Image(
      image: AssetImage(image),
      height: 230,
    );
  }
}
