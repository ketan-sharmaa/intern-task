List courses = [
  {
    'id': 1,
    'image': "card1.png",
    'title': 'Art & Humanities',
    'subtitle': 'Draw & Paint Arts',
    'duration': const Duration(hours: 2, minutes: 20),
  },
  {
    'id': 2,
    'image': "card2.png",
    'title': 'Computer & Technology',
    'subtitle': 'Programming',
    'duration': const Duration(hours: 4, minutes: 20),
  },
  {
    'id': 3,
    'image': "card1.png",
    'title': 'Art & Humanities',
    'subtitle': 'Cultural Arts',
    'duration': const Duration(hours: 2, minutes: 20),
  },
  {
    'id': 4,
    'image': "card2.png",
    'title': 'Computer & Technology',
    'subtitle': 'Networking Ideology',
    'duration': const Duration(hours: 4, minutes: 20),
  },
];

class CardItem {
  final String image;
  final String title;
  final String subtitle;
  final Duration duration;
  final int id;
  CardItem({
    required this.id,
    required this.image,
    required this.title,
    required this.subtitle,
    required this.duration,
  });
  factory CardItem.fromMap(Map<String, dynamic> map) {
    return CardItem(
      id: map['id'],
      image: map['image'],
      title: map['title'],
      subtitle: map['subtitle'],
      duration: map['duration'],
    );
  }
}

class CourseClass {
  static final cc = CourseClass._internal();
  CourseClass._internal();
  factory CourseClass() => cc;
  static List<CardItem> items = List.from(courses)
      .map<CardItem>((item) => CardItem.fromMap(item))
      .toList();
  CardItem getById(int id) => items.firstWhere((element) => element.id == id);
}
