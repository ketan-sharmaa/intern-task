List<CardItem> items = [
  CardItem(
    image: "card1.png",
    title: 'Art & Humanities',
    subtitle: 'Draw & Paint Arts',
    duration:
        '${const Duration(hours: 2).inHours}h ${const Duration(minutes: 20).inMinutes}min',
  ),
  CardItem(
    image: "card2.png",
    title: 'Computer & Technology',
    subtitle: 'Programming',
    duration:
        '${const Duration(hours: 4).inHours}h ${const Duration(minutes: 30).inMinutes}min',
  ),
  CardItem(
    image: "card1.png",
    title: 'Art & Humanities',
    subtitle: 'Draw & Paint Arts',
    duration:
        '${const Duration(hours: 2).inHours}h ${const Duration(minutes: 20).inMinutes}min',
  ),
  CardItem(
    image: "card2.png",
    title: 'Computer & Technology',
    subtitle: 'Programming',
    duration:
        '${const Duration(hours: 4).inHours}h ${const Duration(minutes: 30).inMinutes}min',
  ),
];

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
