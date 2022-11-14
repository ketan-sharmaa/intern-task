import 'package:cloud_firestore/cloud_firestore.dart';

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
      duration: Duration(
          hours: map['duration']['hours'], minutes: map['duration']['minutes']),
    );
  }
}

List courses = [];

class CourseClass {
  Future getCourses() async {
    await FirebaseFirestore.instance
        .collectionGroup('courses')
        .get()
        // ignore: avoid_function_literals_in_foreach_calls
        .then((snapshot) => snapshot.docs.forEach((element) {
              courses.add(element.data());
            }));
  }

  static final cc = CourseClass._internal();
  CourseClass._internal();
  factory CourseClass() => cc;

  static List<CardItem> items = List.from(courses)
      .map<CardItem>((item) => CardItem.fromMap(item))
      .toList();

  CardItem getById(int id) => items.firstWhere((element) => element.id == id);
}

// List courses = [
//   {
//     'id': 1,
//     'image': "card1.png",
//     'title': 'Art & Humanities',
//     'subtitle': 'Draw & Paint Arts',
//     'duration': const Duration(hours: 2, minutes: 20),
//   },
//   {
//     'id': 2,
//     'image': "card2.png",
//     'title': 'Computer & Technology',
//     'subtitle': 'Programming',
//     'duration': const Duration(hours: 4, minutes: 20),
//   },
//   {
//     'id': 3,
//     'image': "card1.png",
//     'title': 'Art & Humanities',
//     'subtitle': 'Cultural Arts',
//     'duration': const Duration(hours: 2, minutes: 20),
//   },
//   {
//     'id': 4,
//     'image': "card2.png",
//     'title': 'Computer & Technology',
//     'subtitle': 'Networking Ideology',
//     'duration': const Duration(hours: 4, minutes: 20),
//   },
// ];

//List<Map<String, dynamic>> courses2 = [];
// Future getcourses() async {
//   getCoursesDocId();
//   CollectionReference fireCourses =
//       FirebaseFirestore.instance.collection('courses');
//   for(int i in coursesDocId){
//     fireCourses.doc(coursesDocId[i]).get().then((snapshot) => snapshot.data.data().forEach((val)={
//       courses2.add(val.);
//     }));}
//    //  courses2 =  snapshot.data!.data();

// }

// class GetFireCourses extends StatelessWidget {
//   final String docId;
//   const GetFireCourses({super.key, required this.docId});

//   @override
//   Widget build(BuildContext context) {
//     CollectionReference fireCourses =
//         FirebaseFirestore.instance.collection('courses');

//     return FutureBuilder(
//       future: fireCourses.doc(docId).get(),
//       builder: (BuildContext context, AsyncSnapshot snapshot) {
//         if (snapshot.connectionState == ConnectionState.done) {
//           Map<String, dynamic> courses =
//               snapshot.data!.data() as Map<String, dynamic>;
//         }
//       },
//     );
//   }
// }
