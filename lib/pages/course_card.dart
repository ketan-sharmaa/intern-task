import 'package:flutter/material.dart';

List<CardItem> items = [
  const CardItem(
      image: "card1.png",
      title: 'Art & Humanities',
      subtitle: 'Draw & Paint Arts',
      duration: '2Hr 20Mins'),
  const CardItem(
      image: "card2.png",
      title: 'Computer & Technology',
      subtitle: 'Programming',
      duration: '4Hr 20Mins'),
  const CardItem(
      image: "card1.png",
      title: 'Art & Humanities',
      subtitle: 'Draw & Paint Arts',
      duration: '2Hr 20Mins'),
  const CardItem(
      image: "card2.png",
      title: 'Computer & Technology',
      subtitle: 'Programming',
      duration: '4Hr 20Mins'),
];

class CourseCard extends StatelessWidget {
  const CourseCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        itemBuilder: ((context, index) => NewCard(item: items[index])),
      ),
    );
  }
}

class CardItem {
  final String image;
  final String title;
  final String subtitle;
  final String duration;

  const CardItem(
      {required this.image,
      required this.title,
      required this.subtitle,
      required this.duration});
}

Widget NewCard({required CardItem item}) => SizedBox(
      height: 250,
      width: 250,
      child: Card(
        child: Column(
          children: [
            Expanded(
                flex: 1,
                child: AspectRatio(
                  aspectRatio: 4 / 2,
                  child: Image.asset(
                    item.image,
                    fit: BoxFit.cover,
                  ),
                )),
            Expanded(
              flex: 1,
              child: Container(
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.all(10),
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
                      const Expanded(flex: 2, child: SizedBox()),
                      Text(
                        item.subtitle,
                        style: const TextStyle(
                          color: Colors.deepPurpleAccent,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      const Expanded(flex: 2, child: SizedBox()),
                      Text(
                        item.duration,
                        style: const TextStyle(
                          color: Colors.deepPurpleAccent,
                          fontWeight: FontWeight.bold,
                          fontSize: 10,
                        ),
                      ),
                      const Expanded(flex: 1, child: SizedBox()),
                    ]),
              ),
            )
          ],
        ),
      ),
    );

class CourseTiles extends StatelessWidget {
  const CourseTiles({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: items.length,
        itemBuilder: ((context, index) => CardTile(item: items[index])),
      ),
    );
  }
}

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
                padding: const EdgeInsets.all(15),
                child: Column(
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
