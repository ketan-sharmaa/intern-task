import 'package:flutter/material.dart';
import 'package:intern_task/widget/card/card_items.dart';
import 'package:intern_task/util/classes.dart';

class CourseTiles extends StatelessWidget {
  const CourseTiles({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: CourseClass.items.length,
      itemBuilder: ((context, index) => Container(
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
                          CourseClass.items[index].image,
                          fit: BoxFit.cover,
                        ),
                      )),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 12, 10, 12),
                      child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              CourseClass.items[index].title,
                              style: const TextStyle(
                                color: Colors.deepPurpleAccent,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            const Expanded(flex: 2, child: SizedBox()),
                            Text(
                              CourseClass.items[index].subtitle,
                              style: const TextStyle(
                                color: Colors.deepPurpleAccent,
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            ),
                            const Expanded(flex: 2, child: SizedBox()),
                            AddButton(course: CourseClass.items[index])
                          ]),
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }
}

// add button to add course in book class screen
class AddButton extends StatefulWidget {
  final CardItem course;
  const AddButton({
    Key? key,
    required this.course,
  }) : super(key: key);

  @override
  State<AddButton> createState() => _AddButtonState();
}

class _AddButtonState extends State<AddButton> {
  final _courseIds = MyCourses();

  @override
  Widget build(BuildContext context) {
    bool isAdded = _courseIds.courses.contains(widget.course) ? true : false;

    return TextButton(
        onPressed: () {
          isAdded = !isAdded;
          if (!isAdded) {
            final course = CourseClass();
            _courseIds.course = course;
            _courseIds.addCourse(widget.course);
            setState(() {});
          }
        },
        style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all<Color>(Colors.deepPurpleAccent)),
        child: isAdded
            ? const Text(
                'Added',
                style: TextStyle(color: Colors.white70),
              )
            : const Text(
                'ADD',
                style: TextStyle(color: Colors.white),
              ));
  }
}
