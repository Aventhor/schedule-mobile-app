import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

initializeDateSettings() {
  initializeDateFormatting();
  Intl.defaultLocale = 'ru';
}

getCurrentFormattedDate() {
  DateTime now = DateTime.now();
  String formattedDate = DateFormat('yMMMd').format(now);
  return formattedDate;
}

getCurrentDayName() {
  DateTime now = DateTime.now();
  String formattedDate = DateFormat('EEEE').format(now);
  formattedDate = toBeginningOfSentenceCase(formattedDate);
  return formattedDate;
}

getCurrentScheduleDay(String dateToParse) {
    DateTime now = DateTime.now();
    DateFormat format = new DateFormat("dd-MM-yyyy");
    dynamic date = format.parse(dateToParse);
    final difference = now.difference(date).inDays;
    
    return difference;
}