import 'package:flutter/material.dart';
import 'package:todo/controller/widgets/circular-container-top-widget.dart';

import '../../controller/constants/app-colors/app-colors.dart';
import '../../controller/constants/app-images/app-images.dart';
import '../../controller/widgets/circular-container-left-widget.dart';
import '../../controller/widgets/image-widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              color: AppColors.primarycolor,
            )
          ],
        ),
        CircularContainerTop(),
        CircularContainerLeft(),


        Positioned(
            top: 80, left: 80, child: ImageWidget(image: AppImages.HomeImg)),
      ],
    ));
  }
}
