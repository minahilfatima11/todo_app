import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:todo/controller/widgets/circular-container-top-widget.dart';
import 'package:todo/controller/widgets/log-out-widget.dart';
import 'package:todo/views/home/insert-data-screen.dart';
import 'package:todo/views/home/update-screen.dart';
import '../../controller/constants/app-colors/app-colors.dart';
import '../../controller/constants/app-images/app-images.dart';
import '../../controller/widgets/back-arrow-widget.dart';
import '../../controller/widgets/circular-container-left-widget.dart';
import '../../controller/widgets/image-widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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
          const begin = Offset(1.0, 0.0);
          const end = Offset.zero;
          const curve = Curves.easeInOut;

          final tween =
          Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
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
                  child: StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection('todos')
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState ==
                          ConnectionState.waiting) {
                        return const Center(
                            child: CircularProgressIndicator());
                      }
                      if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                        return const Center(
                            child: Text('No Data Available'));
                      }
                      final todos = snapshot.data!.docs;

                      return ListView.builder(
                        itemCount: todos.length,
                        itemBuilder: (context, index) {
                          final todo = todos[index];
                          final title = todo['title'] ?? '';
                          final description = todo['description'] ?? '';
                          return Card(
                            elevation: 3,
                            margin: const EdgeInsets.symmetric(
                                vertical: 8, horizontal: 16),
                            child: ListTile(
                              title: Text(
                                title,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.primarycolor,
                                ),
                              ),
                              subtitle: Text(
                                description,
                                style: const TextStyle(
                                  color: Colors.grey, // Light grey color
                                ),
                              ),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  // Edit Icon
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        CupertinoPageRoute(
                                          builder: (context) => UpdateDataScreen(

                                          ),
                                        ),
                                      );
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                        color: AppColors.primarycolor,
                                        shape: BoxShape.circle,
                                      ),
                                      child: const Icon(
                                        Icons.edit,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),

                                  const SizedBox(width: 8),
                                  // Delete Icon
                                  GestureDetector(
                                    onTap: () {
                                      FirebaseFirestore.instance
                                          .collection('todos')
                                          .doc(todo.id)
                                          .delete();
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                        color: Colors.redAccent,
                                        shape: BoxShape.circle,
                                      ),
                                      child: const Icon(
                                        Icons.delete,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
                const SizedBox(height: 80),
              ],
            ),
            const CircularContainerTop(),
            const CircularContainerLeft(),
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
            MaterialPageRoute(
                builder: (context) => const InsertDataScreen()),
          );
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
