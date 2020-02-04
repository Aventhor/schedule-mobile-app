import 'package:schedule_app/models/schedule.dart';
import 'dart:convert';

setScheduleToObj(dynamic scheduleJson) {
  dynamic schedule = jsonDecode(scheduleJson['content']);
  Schedule newSchedule = new Schedule.fromJson(schedule['schedule']);
  return newSchedule;
}

/// for local json load
setLocalScheduleToObj(dynamic scheduleJson) {
  dynamic schedule = jsonDecode(scheduleJson);
  Schedule newSchedule = new Schedule.fromJson(schedule['schedule']);
  return newSchedule;
}
