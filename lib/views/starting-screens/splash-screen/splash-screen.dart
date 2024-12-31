import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo/controller/constants/app-colors/app-colors.dart';
import 'package:todo/controller/constants/app-images/app-images.dart';
import 'package:todo/controller/widgets/button-widget.dart';
import 'package:todo/controller/widgets/image-widget.dart';
import 'package:todo/views/home/home-screen.dart';

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
  // Function to check if the user is logged in
  Future<void> isloggedin() async {
    // Retrieve the current user
    User? check = FirebaseAuth.instance.currentUser;

    // Navigate based on the user status
    if (check == null) {
      Navigator.pushReplacement(
        context,
        CupertinoPageRoute(builder: (context) =>  SignupScreen()),
      );
    } else {
      Navigator.pushReplacement(
        context,
        CupertinoPageRoute(builder: (context) =>  HomeScreen()),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    // Call the function to check user status on initialization
    isloggedin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Center(
        child: Stack(
          children: [
            const CircularContainerTop(),
            const CircularContainerLeft(),
            Column(
              children: [
                const SizedBox(height: 130),
                ImageWidget(image: AppImages.splashImg1),
                const SizedBox(height: 50),
                BlackTextHeading(text: 'Things To Do With TODO'),
                const SizedBox(height: 30),
                 GreyTextParagraph(
                  text:
                  'Stay organized and productive with your personal To-Do List app. Plan, prioritize, and achieve your goals effortlessly!',
                ),
                const SizedBox(height: 30),
                ButtonWidget(
                  text: 'Get Started',
                  ontap: () {
                    // You can add specific navigation or functionality here
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
