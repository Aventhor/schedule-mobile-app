import 'package:schedule_app/models/week.dart';
import 'package:schedule_app/models/schedule.dart';
import 'package:schedule_app/models/day.dart';
import 'package:schedule_app/models/lesson.dart';
import 'dart:convert';

setScheduleToObj(dynamic scheduleJson) {
  dynamic schedule = jsonDecode(scheduleJson['content']);
  Schedule newSchedule = new Schedule.fromJson(schedule['schedule']);
  return newSchedule;
}