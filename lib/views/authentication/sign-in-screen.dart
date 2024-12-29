import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:todo/controller/constants/app-colors/app-colors.dart';
import 'package:todo/controller/widgets/blacktext-heading-widget.dart';
import 'package:todo/controller/widgets/button-widget.dart';
import 'package:todo/controller/widgets/normal-text-widget.dart';
import 'package:todo/views/home/home-screen.dart';

import '../../controller/constants/app-images/app-images.dart';
import '../../controller/widgets/back-arrow-widget.dart';
import '../../controller/widgets/circular-container-left-widget.dart';
import '../../controller/widgets/circular-container-top-widget.dart';
import '../../controller/widgets/image-widget.dart';
import '../../controller/widgets/text-field-widget.dart';

class SignInScreen extends StatefulWidget {
  SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body : SingleChildScrollView(
          child: Stack(
            children: [
              CircularContainerTop(),
              CircularContainerLeft(),
              BackArrowWidget(),
              Column(
                children: [
                  SizedBox(height: 160,),
                  BlackTextHeading(text: 'Welcome Back!'),
                  SizedBox(height: 20,),
                  ImageWidget(image: AppImages.loginImg),
                  SizedBox(height: 24,),
          
                  TextFieldWidget(hintText : 'Enter Your Email Address' , controller: emailController),
                  TextFieldWidget(hintText : 'Enter Your Password' , controller: passwordController),

          
                  SizedBox(height: 40,),
                  isLoading ? SpinKitWaveSpinner(
                    duration: const Duration(seconds: 3),

                    color: AppColors.primarycolor,

                  ) :

                  ButtonWidget(text: 'Sign In', ontap:()
                   async
                  {
                    isLoading = true;

                    setState((){
                      //isLoading = false;
                    });

                    Navigator.push(context , MaterialPageRoute(builder: (context) => HomeScreen()));
                  }),
                  SizedBox(height: 14,),
          
                ],
              ),
            ],
          ),
        )
    );
  }
}
