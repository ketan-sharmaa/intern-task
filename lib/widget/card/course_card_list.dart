import 'package:flutter/material.dart';
import 'package:intern_task/widget/card/card_items.dart';

class CourseCard extends StatefulWidget {
  const CourseCard({super.key});

  @override
  State<CourseCard> createState() => _CourseCardState();
}

class _CourseCardState extends State<CourseCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 250,
          child: FutureBuilder(
            future: CourseClass().getCourses(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return ListView.builder(
                  clipBehavior: Clip.none,
                  scrollDirection: Axis.horizontal,
                  itemCount: CourseClass.items.length,
                  itemBuilder: ((context, index) => Card(
                        child: SizedBox(
                          height: 250,
                          width: 250,
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AspectRatio(
                                  aspectRatio: 2 / 1,
                                  child: Image.asset(
                                    CourseClass.items[index].image,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Container(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 10, 10, 20),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          CourseClass.items[index].title,
                                          style: const TextStyle(
                                            color: Colors.deepPurpleAccent,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                          ),
                                        ),
                                        const SizedBox(height: 10),
                                        Text(
                                          CourseClass.items[index].subtitle,
                                          style: const TextStyle(
                                            color: Colors.deepPurpleAccent,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                          ),
                                        ),
                                        const SizedBox(height: 10),
                                        Text(CourseClass.items[index].duration,
                                            style: const TextStyle(
                                              color: Colors.deepPurpleAccent,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12,
                                            ))
                                      ]),
                                )
                              ]),
                        ),
                      )),
                );
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ),
      ],
    );
  }
}
