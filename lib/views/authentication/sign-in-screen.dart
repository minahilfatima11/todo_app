import 'package:flutter/material.dart';
import 'package:todo/controller/constants/app-colors/app-colors.dart';
import 'package:todo/controller/widgets/blacktext-heading-widget.dart';
import 'package:todo/controller/widgets/button-widget.dart';
import 'package:todo/controller/widgets/normal-text-widget.dart';

import '../../controller/constants/app-images/app-images.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body : Column(
          children: [
            SizedBox(height: 90,),
            BlackTextHeading(text: 'Welcome Back!'),
            SizedBox(height: 20,),
            ImageWidget(image: AppImages.splashImg),
            SizedBox(height: 24,),

            TextFieldWidget(hintText : 'Enter Your Email Address' , controller: emailController),
            TextFieldWidget(hintText : 'Enter Your Password' , controller: passwordController),


            SizedBox(height: 40,),
            ButtonWidget(text: 'Sign In', ontap: (){
              Navigator.push(context , MaterialPageRoute(builder: (context) => SignInScreen()));
            }),
            SizedBox(height: 14,),

          ],
        )
    );
  }
}
