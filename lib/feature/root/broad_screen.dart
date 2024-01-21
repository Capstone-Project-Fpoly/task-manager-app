import 'package:flutter/material.dart';
import 'package:task_manager/constants/colors.dart';
import 'package:task_manager/shared/app_bar/custom_app_bar.dart';

class BroadScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  const Text('Broad Screen'),
      floatingActionButton:
      FloatingActionButton(
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(50.0)),
        ),
        child: const Icon(Icons.add,color: Colors.white),
        onPressed: () {  },
      ),
    );
  }
}