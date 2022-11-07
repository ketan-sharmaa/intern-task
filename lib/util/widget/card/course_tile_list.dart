import 'package:flutter/material.dart';
import 'package:intern_task/util/widget/card/card_items.dart';

class CourseTiles extends StatelessWidget {
  const CourseTiles({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: ((context, index) => CardTile(item: items[index])),
    );
  }
}

// ignore: non_constant_identifier_names
Widget CardTile({required CardItem item}) => SizedBox(
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
              child: Container(
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
