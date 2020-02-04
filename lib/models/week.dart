import 'package:schedule_app/models/day.dart';

class Week {
  final int code;
  final String name;
  final List<Day> days;

  Week({
    this.code,
    this.name,
    this.days
  });

  factory Week.fromJson(Map<String, dynamic> parsedJson){

    var list = parsedJson['days'] as List;
    List<Day> days = list.map((i) => Day.fromJson(i)).toList();

    return Week(
      code: parsedJson['code'],
      name: parsedJson['name'],
      days: days
    );
  }
}