import 'package:intern_task/util/widget/card/card_items.dart';

class MyCourses {
  static final mc = MyCourses._internal();
  MyCourses._internal();
  factory MyCourses() => mc;

  late CourseClass _course;
  final List<int> _courseIds = [];
  CourseClass get course => _course;
  set course(CourseClass newCourse) {
    assert(newCourse != null);
    _course = newCourse;
  }

  List<CardItem> get courses =>
      _courseIds.map((id) => course.getById(id)).toList();

  void addCourse(CardItem cardItem) {
    _courseIds.add(cardItem.id);
  }

  void removeCourse(CardItem cardItem) {
    _courseIds.remove(cardItem.id);
  }
}
