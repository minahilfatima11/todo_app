import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:todo/controller/constants/app-colors/app-colors.dart';
import 'package:todo/controller/widgets/blacktext-heading-widget.dart';
import 'package:todo/controller/widgets/button-widget.dart';
import 'package:todo/controller/widgets/normal-text-widget.dart';
import 'package:todo/views/home/home-screen.dart';

import '../../controller/constants/app-images/app-images.dart';
import '../../controller/widgets/back-arrow-widget.dart';
import '../../controller/widgets/circular-container-left-widget.dart';
import '../../controller/widgets/circular-container-top-widget.dart';
import '../../controller/widgets/text-field-widget.dart';

class InsertDataScreen extends StatefulWidget {
  const InsertDataScreen({super.key});

  @override
  State<InsertDataScreen> createState() => _InsertDataScreenState();
}

class _InsertDataScreenState extends State<InsertDataScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  bool isLoading = false;

  Future<void> insertData() async {
    if (titleController.text.trim().isEmpty || descriptionController.text.trim().isEmpty) {
      Get.snackbar(
        'Error',
        'Both fields are required!',
        icon: const Icon(
          Icons.error_outline,
          color: Colors.white,
        ),
        titleText: const Text(
          'Error',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        duration: const Duration(seconds: 5),
        colorText: Colors.white,
        backgroundColor: AppColors.primarycolor.withOpacity(0.5),
      );
      return;
    }

    setState(() {
      isLoading = true;
    });

    try {
      await FirebaseFirestore.instance.collection('todos').add({
        'title': titleController.text.trim(),
        'description': descriptionController.text.trim(),
        'createdAt': DateTime.now(),
      });

      setState(() {
        isLoading = false;
      });

      Get.snackbar(
        'Success',
        'Your data is successfully added!',
        icon: const Icon(
          Icons.check_circle_outline,
          color: Colors.white,
        ),
        titleText: const Text(
          'Success',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        duration: const Duration(seconds: 5),
        colorText: Colors.white,
        backgroundColor: AppColors.primarycolor.withOpacity(0.5),
      );

      Navigator.pop(context);
    } catch (e) {
      setState(() {
        isLoading = false;
      });

      Get.snackbar(
        'Error',
        e.toString(),
        icon: const Icon(
          Icons.error_outline,
          color: Colors.white,
        ),
        titleText: const Text(
          'Error',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        duration: const Duration(seconds: 5),
        colorText: Colors.white,
        backgroundColor: AppColors.primarycolor.withOpacity(0.5),
      );
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
                const SizedBox(height: 160),
                BlackTextHeading(text: 'Add a New Task'),
                const SizedBox(height: 20),
                NormalTextWidget(
                  text: 'Fill the details below to add a task.',
                  textColor: Color(0xff5B5B5B),
                ),
                const SizedBox(height: 24),
                TextFieldWidget(
                  hintText: 'Enter Title',
                  controller: titleController,
                ),
                TextFieldWidget(
                  hintText: 'Enter Description',
                  controller: descriptionController,
                ),
                const SizedBox(height: 40),
                isLoading
                    ? SpinKitWaveSpinner(
                  duration: const Duration(seconds: 3),
                  color: AppColors.primarycolor,
                )
                    : ButtonWidget(
                  text: 'Insert Data',
                  ontap: () async {
                    await insertData();
                  },
                ),
                const SizedBox(height: 14),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
