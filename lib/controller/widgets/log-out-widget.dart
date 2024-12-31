import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../constants/app-colors/app-colors.dart';
import '../constants/app-icons/app-icons.dart';

class LogOutWidget extends StatelessWidget {
  const LogOutWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 0.0, top: 20.0),
     child: IconButton(onPressed: ()async{
       await FirebaseAuth.instance.signOut();
     }, icon: Icon(Icons.logout)));

  }
}

