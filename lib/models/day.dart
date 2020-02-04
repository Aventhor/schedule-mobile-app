import 'package:schedule_app/models/lesson.dart';

class Day {
  String name;
  String date;
  List<Lesson> lessons;

  Day({
    this.name,
    this.lessons
  });

  factory Day.fromJson(Map<String, dynamic> parsedJson){

    var list = parsedJson['lessons'] as List;
    List<Lesson> lessons = list.map((i) => Lesson.fromJson(i)).toList();

    return Day(
      name: parsedJson['name'],
      lessons: lessons
    );
  }
}
