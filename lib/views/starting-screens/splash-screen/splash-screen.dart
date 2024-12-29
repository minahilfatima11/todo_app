import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo/controller/constants/app-colors/app-colors.dart';
import 'package:todo/controller/constants/app-images/app-images.dart';
import 'package:todo/controller/widgets/button-widget.dart';
import 'package:todo/controller/widgets/image-widget.dart';

import '../../../controller/widgets/blacktext-heading-widget.dart';
import '../../../controller/widgets/circular-container-left-widget.dart';
import '../../../controller/widgets/circular-container-top-widget.dart';
import '../../../controller/widgets/greytext-paragraph-widget.dart';
import '../../authentication/signup-screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Center(
        child: Stack(
          children: [
            CircularContainerTop(),
            CircularContainerLeft(),
            Column(
              children: [
                SizedBox(
                  height: 130,
                ),
                ImageWidget(image: AppImages.splashImg1),
                SizedBox(
                  height: 50,
                ),
                BlackTextHeading(text: 'Things To Do With TODO'),
                SizedBox(
                  height: 30,
                ),
                GreyTextParagraph(
                    text:
                        'Stay organized and productive with your personal To-Do List app. Plan, prioritize, and achieve your goals effortlessly!'),
                SizedBox(
                  height: 30,
                ),
                ButtonWidget(
                    text: 'Get Started',
                    ontap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignupScreen()));
                    }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
