import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/views/home/insert-data-screen.dart';
import 'package:todo/views/starting-screens/splash-screen/splash-screen.dart';

void main() async {
  //connecting
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false, home: //InsertDataScreen());
    SplashScreen());
  }
}
