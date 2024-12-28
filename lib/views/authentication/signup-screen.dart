import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
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

  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: SingleChildScrollView(
          child: Stack(
            children: [
              CircularContainerTop(),
              CircularContainerLeft(),
              BackArrowWidget(),
              Column(
                children: [
                  SizedBox(
                    height: 120,
                  ),
                  BlackTextHeading(text: 'Welcome Onboard!'),
                  SizedBox(
                    height: 20,
                  ),
                  NormalTextWidget(
                    text: 'Let’s help you to meet your Task!',
                    textColor: AppColors.primarycolor,
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  TextFieldWidget(
                      hintText: 'Enter Your Full Name',
                      controller: fullNameController),
                  TextFieldWidget(
                      hintText: 'Enter Your Email Address',
                      controller: emailController),
                  TextFieldWidget(
                      hintText: 'Create Password',
                      controller: passwordController),
                  TextFieldWidget(
                      hintText: 'Confirm Your Password',
                      controller: confirmpasswordController),
                  SizedBox(
                    height: 40,
                  ),
                 isLoading? SpinKitWaveSpinner(
                   duration: const Duration(seconds: 3),

                   color: AppColors.primarycolor,

                 ) : ButtonWidget(
                      text: 'SignUp',
                      ontap: () async {
                        isLoading = true;
          
                        setState((){
                          //isLoading = false;
                        });
                        //firebase auth is class
                        //instance--- pkg class usage so thats why we tell --as like obj
                        await FirebaseAuth.instance
                            .createUserWithEmailAndPassword(
                                email: emailController.text.trim(),
                                password: passwordController.text)
                        .then((value){
                        isLoading = false;
                        setState(() {
                        Navigator.push(context , CupertinoPageRoute(builder: (context)=>SignInScreen()));
                        });
                        
                      }).onError((value , error){
                        isLoading = false;
                        setState(() {

                        });
                        Get.snackbar(
                          icon: const Icon(Icons.error_outline, color: Colors.white),
                          'Error',
                          titleText: const Text(
                            'Error',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          duration: const Duration(seconds: 5),
                          '${value.toString()}',
                          colorText: Colors.white,
                          backgroundColor: AppColors.primarycolor.withOpacity(0.5),
                        );
                      });
                      }),
                  SizedBox(
                    height: 14,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      NormalTextWidget(
                          text: 'Already Have An Account ?',
                          textColor: AppColors.greyishColor),
                      SizedBox(
                        width: 5,
                      ),
                      InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignInScreen()));
                          },
                          child: NormalTextWidget(
                              text: 'Sign In',
                              textColor: AppColors.primarycolor)),
                    ],
                  )
                ],
              ),
            ],
          ),
        ));
  }
}
