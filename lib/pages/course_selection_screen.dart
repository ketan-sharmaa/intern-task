import 'package:flutter/material.dart';

class CourseSelectionScreen extends StatefulWidget {
  const CourseSelectionScreen({super.key});

  @override
  State<CourseSelectionScreen> createState() => _CourseSelectionScreenState();
}

class _CourseSelectionScreenState extends State<CourseSelectionScreen> {
  late List<bool> isSelected;
  bool ischecked = false;

  @override
  void initState() {
    // this is for 3 buttons, add "false" same as the number of buttons here
    isSelected = [true, false, false];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            leading: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.arrow_back_ios_sharp))),
        body: Center(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                Text(
                  'Learning App',
                  style: Theme.of(context).textTheme.headline5,
                ),
                const SizedBox(height: 20),
                Image.asset(
                  'intro.png',
                  scale: 5,
                ),
                const SizedBox(height: 30),
                Text(
                  'Select your course level',
                  style: Theme.of(context).textTheme.headline6,
                ),
                const SizedBox(height: 30),
                ToggleButtons(
                  onPressed: (int index) {
                    setState(() {
                      for (int i = 0; i < isSelected.length; i++) {
                        isSelected[i] = i == index;
                      }
                    });
                  },
                  isSelected: isSelected,
                  borderRadius: BorderRadius.circular(10),
                  selectedColor: Colors.white,
                  fillColor: Theme.of(context).primaryColor,
                  color: Theme.of(context).primaryColor,
                  borderColor: Theme.of(context).primaryColor,
                  children: const <Widget>[
                    // first toggle button
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Beginner',
                      ),
                    ),
                    // second toggle button
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Intermediate',
                      ),
                    ),
                    // third toggle button
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Expert',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 60),
                Row(
                  children: <Widget>[
                    Checkbox(
                        value: ischecked,
                        onChanged: (value) {
                          setState(() {
                            ischecked = value!;
                          });
                        }),
                    Text(
                      'Are you sure?',
                      style: Theme.of(context).textTheme.bodyText1,
                    )
                  ],
                ),
                const SizedBox(height: 15),
                ElevatedButton(onPressed: () {Navigator.pushNamed(context, '/bottomnav');}, child: const Text('Continue'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
