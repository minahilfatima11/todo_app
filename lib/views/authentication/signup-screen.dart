import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo/controller/constants/app-colors/app-colors.dart';
import 'package:todo/controller/widgets/blacktext-heading-widget.dart';
import 'package:todo/controller/widgets/button-widget.dart';
import 'package:todo/controller/widgets/normal-text-widget.dart';
import 'package:todo/views/authentication/sign-in-screen.dart';

import '../../controller/widgets/back-arrow-widget.dart';
import '../../controller/widgets/circular-container-left-widget.dart';
import '../../controller/widgets/circular-container-top-widget.dart';
import '../../controller/widgets/text-field-widget.dart';

class SignupScreen extends StatefulWidget {
  SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmpasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body : Stack(
        children: [
          CircularContainerTop(),
          CircularContainerLeft(),
          BackArrowWidget(),
          Column(
            children: [
              SizedBox(height: 120,),
              BlackTextHeading(text: 'Welcome Onboard!'),
              SizedBox(height: 20,),
              NormalTextWidget(text: 'Let’s help you to meet your Task!' , textColor:AppColors.primarycolor ,),
              SizedBox(height: 24,),
              TextFieldWidget(hintText : 'Enter Your Full Name' , controller: fullNameController),
              TextFieldWidget(hintText : 'Enter Your Email Address' , controller: emailController),
              TextFieldWidget(hintText : 'Create Password' , controller: passwordController),

              TextFieldWidget(hintText : 'Confirm Your Password' , controller: confirmpasswordController),
              SizedBox(height: 40,),
              ButtonWidget(text: 'SignUp', ontap: ()async {
                //irebaseauth is class
                //instance--- pkg class usage so thats why we tell --as like obj
                await FirebaseAuth.instance.createUserWithEmailAndPassword(email: emailController.text.trim(), password: passwordController.text);


              }),
              SizedBox(height: 14,),
              Row(
                  mainAxisAlignment : MainAxisAlignment.center,
                children: [

                NormalTextWidget(text: 'Already Have An Account ?', textColor: AppColors.greyishColor),
                SizedBox(width: 5,),
                InkWell(
                    onTap: (){
                      Navigator.push(context , MaterialPageRoute(builder: (context) => SignInScreen()));
                    },
                    child: NormalTextWidget(text: 'Sign In', textColor: AppColors.primarycolor)),
              ],)
            ],
          ),
        ],
      )
    );
  }
}
