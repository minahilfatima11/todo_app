import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import '../../controller/constants/app-colors/app-colors.dart';
import '../../controller/widgets/blacktext-heading-widget.dart';
import '../../controller/widgets/button-widget.dart';
import '../../controller/widgets/normal-text-widget.dart';
import '../../views/authentication/sign-in-screen.dart';
import '../../controller/widgets/back-arrow-widget.dart';
import '../../controller/widgets/circular-container-left-widget.dart';
import '../../controller/widgets/circular-container-top-widget.dart';
import '../../controller/widgets/password-field.dart';
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

  void signUpUser() async {
    if (fullNameController.text.trim().isEmpty ||
        emailController.text.trim().isEmpty ||
        passwordController.text.isEmpty ||
        confirmpasswordController.text.isEmpty) {
      Get.snackbar(
        "Error",
        "All fields are required!",
        backgroundColor: AppColors.primarycolor.withOpacity(0.5),
        colorText: Colors.white,
        icon: Icon(Icons.error_outline, color: Colors.white),
        duration: Duration(seconds: 3),
      );
      return;
    }

    if (passwordController.text != confirmpasswordController.text) {
      Get.snackbar(
        "Error",
        "Passwords do not match!",
        backgroundColor: AppColors.primarycolor.withOpacity(0.5),
        colorText: Colors.white,
        icon: Icon(Icons.error_outline, color: Colors.white),
        duration: Duration(seconds: 3),
      );
      return;
    }

    setState(() {
      isLoading = true;
    });

    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text,
      );

      await FirebaseFirestore.instance
          .collection("users")
          .doc(userCredential.user!.uid)
          .set({
        "fullName": fullNameController.text,
        "email": emailController.text,
        "createdAt": FieldValue.serverTimestamp(),
        "updatedAt": FieldValue.serverTimestamp(),
        "status": "active",
      });

      Get.snackbar(
        "Success",
        "Account created successfully!",
        backgroundColor: Colors.green.withOpacity(0.5),
        colorText: Colors.white,
        icon: Icon(Icons.check_circle, color: Colors.white),
        duration: Duration(seconds: 3),
      );

      Navigator.pushReplacement(
        context,
        CupertinoPageRoute(builder: (context) => SignInScreen()),
      );
    } on FirebaseAuthException catch (e) {
      Get.snackbar(
        "Error",
        e.message ?? "An unknown error occurred",
        backgroundColor: AppColors.primarycolor.withOpacity(0.5),
        colorText: Colors.white,
        icon: Icon(Icons.error_outline, color: Colors.white),
        duration: Duration(seconds: 5),
      );
    } catch (e) {
      Get.snackbar(
        "Error",
        "An unexpected error occurred. Please try again.",
        backgroundColor: AppColors.primarycolor.withOpacity(0.5),
        colorText: Colors.white,
        icon: Icon(Icons.error_outline, color: Colors.white),
        duration: Duration(seconds: 5),
      );
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            CircularContainerTop(),
            CircularContainerLeft(),
            Column(
              children: [
                SizedBox(height: 120),
                BlackTextHeading(text: 'Welcome Onboard!'),
                SizedBox(height: 20),
                NormalTextWidget(
                  text: 'Let’s help you to meet your Task!',
                  textColor: AppColors.primarycolor,
                ),
                SizedBox(height: 24),
                TextFieldWidget(
                  hintText: 'Enter Your Full Name',
                  controller: fullNameController,
                ),
                TextFieldWidget(
                  hintText: 'Enter Your Email Address',
                  controller: emailController,
                ),
                PasswordFieldWidget(
                  hintText: 'Create Password',
                  controller: passwordController,
                ),
                PasswordFieldWidget(
                  hintText: 'Confirm Your Password',
                  controller: confirmpasswordController,
                ),
                SizedBox(height: 40),
                isLoading
                    ? SpinKitWaveSpinner(
                        duration: const Duration(seconds: 3),
                        color: AppColors.primarycolor,
                      )
                    : ButtonWidget(
                        text: 'SignUp',
                        ontap: signUpUser,
                      ),
                SizedBox(height: 14),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    NormalTextWidget(
                      text: 'Already Have An Account ?',
                      textColor: AppColors.greyishColor,
                    ),
                    SizedBox(width: 5),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignInScreen(),
                          ),
                        );
                      },
                      child: NormalTextWidget(
                        text: 'Sign In',
                        textColor: AppColors.primarycolor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
