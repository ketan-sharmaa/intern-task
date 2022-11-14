import 'package:intern_task/widget/card/card_items.dart';

class MyCourses {
  //need to understand
  static final mc = MyCourses._internal();
  MyCourses._internal();
  factory MyCourses() => mc;

  late CourseClass course;

//course id list to be used to generate added course list
  final List<int> _courseIds = [];

//getting courses in card constructor to generate card by id
  List<CardItem> get courses =>
      _courseIds.map((id) => course.getById(id)).toList();

//to add course
  void addCourse(CardItem cardItem) {
    _courseIds.add(cardItem.id);
  }

//to remove course
  void removeCourse(CardItem cardItem) {
    _courseIds.remove(cardItem.id);
  }
}
