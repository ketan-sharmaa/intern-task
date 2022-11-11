import 'package:flutter/material.dart';
import 'package:intern_task/util/classes.dart';
import 'package:intern_task/widget/card/card_items.dart';

class MyClassesScreen extends StatefulWidget {
  const MyClassesScreen({super.key});

  @override
  State<MyClassesScreen> createState() => _MyClassesScreenState();
}

class _MyClassesScreenState extends State<MyClassesScreen> {
  final _courses = MyCourses();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('My Classes'),
          automaticallyImplyLeading: false,
        ),
        body: ListView.builder(
          itemCount: _courses.courses.length,
          itemBuilder: (BuildContext context, int index) {
            return classTile(item: _courses.courses[index]);
          },
        ),
      ),
    );
  }
}

Widget classTile({required CardItem item}) => Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      height: 120,
      child: Card(
        child: Row(
          children: [
            Expanded(
                flex: 1,
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Image.asset(
                    item.image,
                    fit: BoxFit.cover,
                  ),
                )),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 18, 10, 15),
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.title,
                        style: const TextStyle(
                          color: Colors.deepPurpleAccent,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      const Expanded(flex: 2, child: SizedBox()),
                      Text(
                        item.subtitle,
                        style: const TextStyle(
                          color: Colors.deepPurpleAccent,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                      const Expanded(flex: 2, child: SizedBox()),
                      const Text(
                        'progressbar',
                        style: TextStyle(
                          color: Colors.deepPurpleAccent,
                          fontWeight: FontWeight.bold,
                          fontSize: 10,
                        ),
                      ),
                    ]),
              ),
            )
          ],
        ),
      ),
    );
