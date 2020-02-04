import 'package:schedule_app/models/week.dart';

class Schedule {
  int startWeekPoint;
  int startDayPoint;
  String startDate;
  List<Week> weeks;

  Schedule({
    this.startWeekPoint,
    this.startDayPoint,
    this.startDate,
    this.weeks
  });

  factory Schedule.fromJson(Map<String, dynamic> parsedJson){

    var list = parsedJson['weeks'] as List;
    List<Week> weeks = list.map((i) => Week.fromJson(i)).toList();

    return Schedule(
      startWeekPoint: parsedJson['startWeekPoint'],
      startDayPoint: parsedJson['startDayPoint'],
      startDate: parsedJson['startDate'],
      weeks: weeks,
    );
  }
}