import 'package:flutter/material.dart';
import 'package:intern_task/pages/course_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            title: const Text('Home'),
            leading: IconButton(
                onPressed: () {Navigator.pop(context);},
                icon: const Icon(Icons.arrow_back_ios_sharp))),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              Text(
                'Welcome Back John Doe',
                style: Theme.of(context).textTheme.headline4,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    flex: 1,
                    child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        child: const FittedBox(child: Text('Book Class'))),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    flex: 1,
                    child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        child: const FittedBox(child: Text('My Courses'))),
                  ),
                ],
              ),
              const SizedBox(height: 50),
              Text(
                'Last Classes',
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 30,
                ),
              ),
              const SizedBox(height: 20),
              const CourseCard(),
            ],
          ),
        ),
      ),
    );
  }
}
