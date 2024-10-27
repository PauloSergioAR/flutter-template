import 'package:intl/intl.dart';

extension DateParsing on DateTime {
  String dateTimeToString(String outputFormat) {
    DateFormat outputDateFormat = DateFormat(outputFormat);
    return outputDateFormat.format(toLocal());
  }

  String dateTimeToStringUTC(String outputFormat) {
    DateFormat outputDateFormat = DateFormat(outputFormat);
    return outputDateFormat.format(this);
  }

  String formatStringDate(String inputFormat, String outputFormat) {
    DateFormat inputDateFormat = DateFormat(inputFormat);
    DateTime dateTime = inputDateFormat.parse(toString());
    DateFormat outputDateFormat = DateFormat(outputFormat);
    return outputDateFormat.format(dateTime);
  }

  DateTime formatDate(String inputFormat, String outputFormat) {
    DateFormat inputDateFormat = DateFormat(inputFormat);
    DateTime dateTime = inputDateFormat.parse(toString());
    DateFormat outputDateFormat = DateFormat(outputFormat);
    return DateTime.parse(outputDateFormat.format(dateTime));
  }
}

extension DateStringParsing on String {
  DateTime? formatStringToDate(String outputFormat) {
    DateTime dateTime = DateTime.parse(toString());
    DateFormat outputDateFormat = DateFormat(outputFormat);
    return DateTime.tryParse(outputDateFormat.format(dateTime));
  }

  DateTime? formatDateStringToDate(String inputFormat, String outputFormat) {
    DateFormat inputDateFormat = DateFormat(inputFormat);
    DateTime dateTime = inputDateFormat.parse(toString());
    DateFormat outputDateFormat = DateFormat(outputFormat);
    return DateTime.tryParse(outputDateFormat.format(dateTime));
  }
}

extension DateOperations on DateTime {
  DateTime addMonths(int months) {
    int newYear = year + (month + months - 1) ~/ 12;
    int newMonth = (month + months - 1) % 12 + 1;
    int newDay = day;

    while (newDay > DateTime(newYear, newMonth + 1, 0).day) {
      newDay--;
    }

    return DateTime(newYear, newMonth, newDay, hour, minute, second,
        millisecond, microsecond);
  }
}
