import 'package:flutter/material.dart';
import 'package:intern_task/util/widget/card/card_items.dart';

class CourseCard extends StatelessWidget {
  const CourseCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 250,
          child: ListView.builder(
            clipBehavior: Clip.none,
            scrollDirection: Axis.horizontal,
            itemCount: items.length,
            itemBuilder: ((context, index) => NewCard(item: items[index])),
          ),
        ),
      ],
    );
  }
}

// ignore: non_constant_identifier_names
Widget NewCard({required CardItem item}) => Card(
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
                  item.image,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 20),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.title,
                        style: const TextStyle(
                          color: Colors.deepPurpleAccent,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        item.subtitle,
                        style: const TextStyle(
                          color: Colors.deepPurpleAccent,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(item.duration,
                          style: const TextStyle(
                            color: Colors.deepPurpleAccent,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ))
                    ]),
              )
            ]),
      ),
    );
