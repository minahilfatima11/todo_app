import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/views/starting-screens/splash-screen/splash-screen.dart';


//get used for
//it is state management and its architecture and for code shortage --
//1st usage --- used for navigations ...Get.to(()=> FbScreen())


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: //Container()
      SplashScreen()

    );
  }
}
