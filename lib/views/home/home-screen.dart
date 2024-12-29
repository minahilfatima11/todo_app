import 'package:flutter/material.dart';
import 'package:todo/controller/widgets/circular-container-top-widget.dart';

import '../../controller/constants/app-colors/app-colors.dart';
import '../../controller/constants/app-images/app-images.dart';
import '../../controller/widgets/back-arrow-widget.dart';
import '../../controller/widgets/circular-container-left-widget.dart';
import '../../controller/widgets/image-widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Stack(
        children: [
          Column(
            children: [
              Container(
                height: 300,
                width: double.infinity,
                color: AppColors.primarycolor,
              ),
              SizedBox(
                height: 20,
              ),
              Text('TODO LIST..!',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 26,
                    color: AppColors.primarycolor,
                  )),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 280,
                width: 250,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  color: AppColors.primarycolor.withOpacity(0.4),
                ),
              ),
              SizedBox(
                height: 80,
              ),
              Row(
                children: [
                  Positioned(
                    top: 520,
                    left: -102,
                    child: Container(
                      height: 80,
                      width: 120,
                      decoration: BoxDecoration(
                          color: Color(0xff6a6395).withOpacity(0.3),
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(220),
                              //bottomLeft: Radius.circular(220),
                              //bottomRight: Radius.circular(220),
                              topLeft: Radius.circular(220))),
                    ),
                  ),
                  Positioned(
                    top: 720,
                    left: 66,
                    child: Container(
                      height: 80,
                      width: 120,
                      decoration: BoxDecoration(
                          color: Color(0xff6a6395).withOpacity(0.3),
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(220),
                              //bottomLeft: Radius.circular(220),
                              //bottomRight: Radius.circular(220),
                              topLeft: Radius.circular(220))),
                    ),
                  ),
                  Positioned(
                    top: 720,
                    right: -18,
                    child: Container(
                      height: 80,
                      width: 120,
                      decoration: BoxDecoration(
                          color: Color(0xff6a6395).withOpacity(0.3),
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(220),
                              //bottomLeft: Radius.circular(220),
                              //bottomRight: Radius.circular(220),
                              topLeft: Radius.circular(220))),
                    ),
                  ),
                ],
              )
            ],
          ),
          CircularContainerTop(),
          CircularContainerLeft(),
          BackArrowWidget(),
          Positioned(
              top: 80, left: 80, child: ImageWidget(image: AppImages.HomeImg)),
        ],
      ),
    ));
  }
}
