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

import '../../controller/widgets/circular-container-left-widget.dart';
import '../../controller/widgets/circular-container-top-widget.dart';
import '../../controller/widgets/text-field-widget.dart';

class UpdateDataScreen extends StatefulWidget {
  final String docId;

  const UpdateDataScreen({
    super.key,
    required this.docId,
  });

  @override
  State<UpdateDataScreen> createState() => _UpdateDataScreenState();
}

class _UpdateDataScreenState extends State<UpdateDataScreen> {
  late TextEditingController titleController;
  late TextEditingController descriptionController;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController();
    descriptionController = TextEditingController();
    fetchData();
  }

  // Fetch the data based on docId
  Future<void> fetchData() async {
    setState(() {
      isLoading = true;
    });

    try {
      DocumentSnapshot doc = await FirebaseFirestore.instance
          .collection('todos')
          .doc(widget.docId)
          .get();

      if (doc.exists) {
        titleController.text = doc['title'];
        descriptionController.text = doc['description'];
      } else {
        Get.snackbar(
          'Error',
          'Document not found!',
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
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to load data: $e',
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
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<void> updateData() async {
    if (titleController.text.trim().isEmpty ||
        descriptionController.text.trim().isEmpty) {
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
      await FirebaseFirestore.instance
          .collection('todos')
          .doc(widget.docId)
          .update({
        'title': titleController.text.trim(),
        'description': descriptionController.text.trim(),
      });

      setState(() {
        isLoading = false;
      });

      Get.snackbar(
        'Success',
        'Your data is successfully updated!',
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

      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => HomeScreen(),
          )); // Navigate back after update
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
                BlackTextHeading(text: 'Update Task'),
                const SizedBox(height: 20),
                NormalTextWidget(
                  text: 'Modify the details below to update the task.',
                  textColor: const Color(0xff5B5B5B),
                ),
                const SizedBox(height: 24),
                isLoading
                    ? SpinKitWaveSpinner(
                  duration: Duration(seconds: 3),
                  color: AppColors.primarycolor,
                )
                    : Column(
                  children: [
                    TextFieldWidget(
                      hintText: 'Enter Title',
                      controller: titleController,
                    ),
                    TextFieldWidget(
                      hintText: 'Enter Description',
                      controller: descriptionController,
                    ),
                    const SizedBox(height: 40),
                    ButtonWidget(
                      text: 'Update Data',
                      ontap: () async {
                        await updateData();
                      },
                    ),
                    const SizedBox(height: 14),
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