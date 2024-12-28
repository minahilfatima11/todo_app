import 'package:flutter/material.dart';

class AppLoader extends StatelessWidget {
  final bool isLoading;

  AppLoader({required this.isLoading});

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Center(
      child: CircularProgressIndicator(), // Loader widget
    )
        : Container(); // Empty container when not loading
  }
}
