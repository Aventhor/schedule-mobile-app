import 'package:schedule_app/models/content-category.dart';

const CATEGORIES_IDS = {
  'FIRST_WEEK': 1,
  "SECOND_WEEK": 2,
  "CHANGES": 3,
  "EXAMS": 4
};

final List<ContentCategory> categories = [
  new ContentCategory(4, 'Экзамены', 'assets/images/exams.png'),
  new ContentCategory(
      3, 'Временные изменения', 'assets/images/schedule-changes.jpg'),
  new ContentCategory(1, '1 неделя', 'assets/images/week-head.png'),
  new ContentCategory(2, '2 неделя', 'assets/images/week-head.png')
];
