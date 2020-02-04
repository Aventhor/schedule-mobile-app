class Lesson {
  String name;
  String startTime;
  String endTime;
  String type;
  String place;
  String teacher;

  Lesson({
    this.name,
    this.startTime,
    this.endTime,
    this.type,
    this.place,
  });

  factory Lesson.fromJson(Map<String, dynamic> parsedJson){
    return Lesson(
      name: parsedJson['name'],
      startTime: parsedJson['startTime'],
      endTime: parsedJson['endTime'],
      type: parsedJson['type'],
      place: parsedJson['place'],
    );
  }
}