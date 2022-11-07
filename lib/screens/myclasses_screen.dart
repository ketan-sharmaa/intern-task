import 'package:flutter/material.dart';
import 'package:intern_task/util/widget/card/course_tile_list.dart';

class MyClassesScreen extends StatefulWidget {
  const MyClassesScreen({super.key});

  @override
  State<MyClassesScreen> createState() => _MyClassesScreenState();
}

class _MyClassesScreenState extends State<MyClassesScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            title: const Text('My Classes'),
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back_ios_sharp))),
        body: Container(
          padding: const EdgeInsets.all(30),
          child: const CourseTiles(),
        ),
      ),
    );
  }
}
