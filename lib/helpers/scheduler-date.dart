import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

initializeDateSettings() {
  initializeDateFormatting();
  Intl.defaultLocale = 'ru';
}

getFormattedDate(DateTime date) {
  String formattedDate = DateFormat('yMMMd').format(date);
  return formattedDate;
}

getDayName(DateTime date) {
  String formattedDate = DateFormat('EEEE').format(date);
  formattedDate = toBeginningOfSentenceCase(formattedDate);
  return formattedDate;
}

getCurrentScheduleDay(DateTime startDate, String dateToParse,
    int weekStartPoint, int dayStartPoint) {
  DateFormat format = new DateFormat("dd-MM-yyyy");
  dynamic date = format.parse(dateToParse);
  final difference = startDate.difference(date).inDays;

  if (difference == 0) {
    return {'week': weekStartPoint, 'day': 1};
  } else if (difference < 0) {
    return {'week': weekStartPoint, 'day': 7};
  } else if (difference <= 7) {
    return {'week': weekStartPoint, 'day': difference};
  } else {
    int temp = 0;
    int weekIndex = 2;
    while (temp <= difference) {
      weekIndex % 2 == 0 ? weekIndex -= 1 : weekIndex += 1;

      if (temp + 7 >= difference) {
        weekIndex % 2 == 0 ? weekIndex -= 1 : weekIndex += 1;
        break;
      }

      temp += 7;
    }
    temp = difference - temp;
    return {'week': weekIndex, 'day': temp == 0 ? 1 : temp};
  }
}
