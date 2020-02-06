import 'package:schedule_app/models/week.dart';
import 'package:schedule_app/models/day.dart';

class Schedule {
  int startWeekPoint;
  int startDayPoint;
  String startDate;
  List<Week> weeks;
  List<Day> changes;
  List<Day> exams;

  Schedule({
    this.startWeekPoint,
    this.startDayPoint,
    this.startDate,
    this.weeks,
    this.changes,
    this.exams,
  });

  factory Schedule.fromJson(Map<String, dynamic> parsedJson) {
    var weeks = parsedJson['weeks'] as List;
    List<Week> weeksList = weeks.map((i) => Week.fromJson(i)).toList();

    var changes = parsedJson['changes'] as List;
    List<Day> changesList = changes.map((i) => Day.fromJson(i)).toList();

    var exams = parsedJson['exams'] as List;
    List<Day> examsList = exams.map((i) => Day.fromJson(i)).toList();

    return Schedule(
      startWeekPoint: parsedJson['startWeekPoint'],
      startDayPoint: parsedJson['startDayPoint'],
      startDate: parsedJson['startDate'],
      weeks: weeksList,
      changes: changesList,
      exams: examsList,
    );
  }
}
