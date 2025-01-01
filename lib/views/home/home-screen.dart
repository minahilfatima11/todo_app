import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:todo/controller/widgets/circular-container-top-widget.dart';
import 'package:todo/controller/widgets/log-out-widget.dart';
import 'package:todo/views/home/insert-data-screen.dart';
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
  void navigateToInsertDataScreen() {
    Navigator.of(context).push(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
        const InsertDataScreen(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(1.0, 0.0); // Start from the right
          const end = Offset.zero; // Move to the center
          const curve = Curves.easeInOut;

          final tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
          final offsetAnimation = animation.drive(tween);

          return SlideTransition(
            position: offsetAnimation,
            child: child,
          );
        },
      ),
    );
  }

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
                const SizedBox(height: 20),
                Text(
                  'TODO LIST..!',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 26,
                    color: AppColors.primarycolor,
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  height: 400,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    color: AppColors.backgroundColor.withOpacity(0.4),
                  ),
                ),
                const SizedBox(height: 80),
              ],
            ),
            const CircularContainerTop(),
            const CircularContainerLeft(),
           /* Padding(
              padding: const EdgeInsets.only(top: 730, left: 0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  height: 80,
                  width: 140,
                  decoration: BoxDecoration(
                    color: const Color(0xff6a6395).withOpacity(0.3),
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(220),
                      topLeft: Radius.circular(220),
                    ),
                  ),
                ),
              ),
            ),
            /*Padding(
              padding: const EdgeInsets.only(top: 730, left: 116),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  height: 80,
                  width: 140,
                  decoration: BoxDecoration(
                    color: const Color(0xff6a6395).withOpacity(0.3),
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(220),
                      topLeft: Radius.circular(220),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 730, right: 0),
              child: Align(
                alignment: Alignment.centerRight,
                child: Container(
                  height: 80,
                  width: 140,
                  decoration: BoxDecoration(
                    color: const Color(0xff6a6395).withOpacity(0.3),
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(220),
                      topLeft: Radius.circular(220),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 6),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const BackArrowWidget(),
                  const LogOutWidget(),
                ],
              ),
            ),*/*/
            Padding(
              padding: const EdgeInsets.only(top: 70, left: 50),
              child: Align(
                alignment: Alignment.center,
                child: ImageWidget(image: AppImages.HomeImg),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primarycolor,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const InsertDataScreen()),
          );
        },
        child: const Icon(Icons.add , color: Colors.white,),
      ),

    );
  }
}


