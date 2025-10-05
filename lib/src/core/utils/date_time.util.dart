import 'package:flutter/material.dart';

class DateTimeUtil {
  static Future<DateTime?> dateTimePicker(
    BuildContext context, {
    bool barrierDismissible = true,
    DatePickerEntryMode? datePickerEntryMode,
    DatePickerMode? datePickerMode,
    DateTime? initialDate,
    DateTime? firstDate,
    DateTime? lastDate,
    bool isDisableSaturday = false,
    bool isDisableSunday = false,
    List<DateTime>? holidayDate,
  }) async {
    final date = await showDatePicker(
      context: context,
      barrierDismissible: barrierDismissible,
      initialDate: initialDate ?? DateTime.now(),
      initialEntryMode: datePickerEntryMode ?? DatePickerEntryMode.calendar,
      initialDatePickerMode: datePickerMode ?? DatePickerMode.day,
      firstDate: firstDate ??
          DateTime.now().subtract(
            const Duration(days: 365),
          ),
      lastDate: lastDate ??
          DateTime.now().add(
            const Duration(days: 365),
          ),
      selectableDayPredicate: (day) {
        bool saturdayDisable = true;
        if (isDisableSaturday) {
          saturdayDisable = day.weekday != DateTime.saturday;
        }

        bool sundayDisable = true;
        if (isDisableSunday) {
          sundayDisable = day.weekday != DateTime.sunday;
        }

        return saturdayDisable && sundayDisable;
      },
    );

    return date;
  }

  static Future<DateTimeRange?> dateTimeRangePicker(
    BuildContext context, {
    bool barrierDismissible = true,
    DatePickerEntryMode? datePickerEntryMode,
    DatePickerMode? datePickerMode,
    DateTime? initialDate,
    DateTime? firstDate,
    DateTime? lastDate,
    bool isDisableSaturday = false,
    bool isDisableSunday = false,
    List<DateTime>? holidayDate,
  }) async {
    final date = await showDateRangePicker(
      context: context,
      barrierDismissible: barrierDismissible,
      currentDate: initialDate ?? DateTime.now(),
      initialEntryMode: datePickerEntryMode ?? DatePickerEntryMode.calendar,
      initialDateRange: DateTimeRange(
        start: DateTime.now().subtract(const Duration(days: 1)),
        end: DateTime.now(),
      ),
      firstDate: firstDate ??
          DateTime.now().subtract(
            const Duration(days: 365),
          ),
      lastDate: lastDate ??
          DateTime.now().add(
            const Duration(days: 365),
          ),
    );

    return date;
  }

  static String getXTimestamp({DateTime? dateTime}) {
    final timestamp = dateTime ?? DateTime.now();
    return timestamp.millisecondsSinceEpoch.toString();
  }

  static String convertDate({DateTime? dateTime}) {
    String result = '-';

    if (dateTime != null) {
      List<String> month = [
        'Januari',
        'Februari',
        'Maret',
        'April',
        'Mei',
        'Juni',
        'Juli',
        'Agustus',
        'September',
        'Oktober',
        'November',
        'Desember'
      ];

      result = '${dateTime.day} ${month[dateTime.month - 1]} ${dateTime.year}';
    }

    return result;
  }

  static String convertDateAndTime({DateTime? dateTime}) {
    String result = '-';

    if (dateTime != null) {
      List<String> month = [
        'Januari',
        'Februari',
        'Maret',
        'April',
        'Mei',
        'Juni',
        'Juli',
        'Agustus',
        'September',
        'Oktober',
        'November',
        'Desember'
      ];

      String time =
          '${(dateTime.hour) < 10 ? '0${dateTime.hour}' : dateTime.hour}.${(dateTime.minute) < 10 ? '0${dateTime.minute}' : dateTime.minute}';
      result =
          '${dateTime.day} ${month[dateTime.month - 1]} ${dateTime.year}, $time';
    }

    return result;
  }

  static String getDifferenceTime({DateTime? dateTime}) {
    String result = '';

    int seconds =
        DateTime.now().difference(dateTime ?? DateTime.now()).inSeconds;
    if (seconds < 60) {
      result = seconds > 1 ? 'A second ago' : '$seconds seconds ago';
    }

    int minute = (seconds / 60).round();
    if (minute > 0) {
      int minutes =
          DateTime.now().difference(dateTime ?? DateTime.now()).inMinutes;
      result = minutes > 1 ? 'A minute ago' : '$minutes minutes ago';
    }

    int hour = ((seconds / 60) / 60).round();
    if (hour > 0) {
      int hours = DateTime.now().difference(dateTime ?? DateTime.now()).inHours;
      result = hours > 1 ? 'A hour ago' : '$hours hours ago';
    }

    int days = (((seconds / 60) / 60) / 24).round();
    if (days > 0) {
      int days = DateTime.now().difference(dateTime ?? DateTime.now()).inDays;
      result = days > 1 ? 'A day ago' : '$days days ago';
    }

    return result;
  }
}
