import 'package:flutter/material.dart';
import 'package:intern_task/util/widget/card/course_tile_list.dart';

class BookClassScreen extends StatefulWidget {
  const BookClassScreen({super.key});

  @override
  State<BookClassScreen> createState() => _BookClassScreenState();
}

class _BookClassScreenState extends State<BookClassScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            title: const Text('BOOK YOUR CLASS'),
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back_ios_sharp))),
        body: const CourseTiles(),
      ),
    );
  }
}
