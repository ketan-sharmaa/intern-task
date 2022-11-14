import 'package:duration_picker/duration_picker.dart';
import 'package:flutter/material.dart';
import 'package:intern_task/authentication/authentication_service.dart';
import 'package:intern_task/widget/card/card_items.dart';
import 'package:intern_task/widget/card/course_tile_list.dart';

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
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
                builder: (BuildContext context) {
                  return AlertDialog(
                    content: const AddNewCourse(),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: Text('Ok',
                              style: Theme.of(context).textTheme.headline6),
                        ),
                      )
                    ],
                  );
                },
                context: context);
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}

class AddNewCourse extends StatefulWidget {
  const AddNewCourse({super.key});

  @override
  State<AddNewCourse> createState() => _AddNewCourseState();
}

class _AddNewCourseState extends State<AddNewCourse> {
  _AddNewCourseState() {
    _image = _imageList[0];
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _title = TextEditingController();
  final _subtitle = TextEditingController();
  final _showDuration = TextEditingController();
  Duration _duration = const Duration(hours: 0, minutes: 0);

  final _imageList = ['card1.png', 'card2.png'];
  String _image = '';

  @override
  void dispose() {
    _title.dispose();
    _subtitle.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Form(
          key: _formKey,
          child: Column(children: [
            const SizedBox(height: 15),
            TextFormField(
              controller: _title,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter title';
                }
                return null;
              },
              decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                labelText: 'Course Title',
              ),
            ),
            const SizedBox(height: 15),
            TextFormField(
              controller: _subtitle,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter subtitle';
                }
                return null;
              },
              decoration: const InputDecoration(
                labelText: 'Course Subtitle',
              ),
            ),
            const SizedBox(height: 15),
            DropdownButtonFormField(
              value: _image,
              items: _imageList.map((e) {
                return DropdownMenuItem(
                  value: e,
                  child: Text(e),
                );
              }).toList(),
              onChanged: (val) {
                setState(() {
                  _image = val as String;
                });
              },
              icon: const Icon(Icons.arrow_drop_down_circle),
              decoration: const InputDecoration(
                labelText: 'Select Image',
              ),
            ),
            const SizedBox(height: 15),
            TextFormField(
              controller: _showDuration,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              onTap: () async {
                _duration = (await showDurationPicker(
                  context: context,
                  initialTime: const Duration(minutes: 30),
                ))!;
                setState(() {
                  _showDuration.text =
                      '${_duration.inHours}h ${_duration.inMinutes.remainder(60)}min';
                });
              },
              decoration: const InputDecoration(
                icon: Icon(Icons.timer),
                labelText: 'Select Duration',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  Authentication().addNewCourse(
                      title: _title.text.trim(),
                      subtitle: _subtitle.text.trim(),
                      image: _image,
                      id: courses.length + 1,
                      hours: _duration.inHours,
                      minutes: _duration.inMinutes.remainder(60));
                }
              },
              child: const Text('Add'),
            ),
          ]),
        ),
      ],
    );
  }
}
