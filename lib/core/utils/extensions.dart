import 'package:intl/intl.dart';

String formatTime(String timeString) {
  final parsedTime = DateFormat("HH:mm:ss").parse(timeString);

  return DateFormat("hh:mm a").format(parsedTime);
}

String customFormatTime(String timeString) {
  final parsedTime = DateFormat("HH:mm:ss").parse(timeString);

  final hour = parsedTime.hour == 0 ? 12 : parsedTime.hour;
  final minute = parsedTime.minute;
  final period = parsedTime.hour >= 12 ? 'PM' : 'AM';

  if (minute == 0) {
    return '$hour$period'; // e.g., "9am"
  } else {
    return '$hour:${minute.toString().padLeft(2, '0')}$period'; // e.g., "9:30am"
  }
}

String getDayName(String dateString, String locale) {
  final date = DateTime.parse(dateString); // e.g. "2025-05-18"
  final formatter = DateFormat.EEEE(locale); // Full weekday name
  return formatter.format(date); // e.g. "Sunday" in the selected locale
}

Map<String, dynamic> getDayAndMonth(String dateString, String locale) {
  final date = DateTime.parse(dateString); // e.g., "2025-05-18"
  final day = DateFormat('dd', locale).format(date); // "18"
  final month = DateFormat('MMM', locale).format(date); // "May"
  return {
    'day': day,
    'month': month,
  };
}

DateTime combineWithToday(String timeStr) {
  final now = DateTime.now();
  final fullDateStr = "${now.toIso8601String().split('T')[0]}T$timeStr";
  return DateTime.parse(fullDateStr);
}

String formatExamDate(String examDateStr) {
  final examDate = DateTime.parse(examDateStr);
  final now = DateTime.now();

  // Only compare year, month, and day
  final isToday = examDate.year == now.year &&
      examDate.month == now.month &&
      examDate.day == now.day;

  if (isToday) {
    return 'Today';
  } else {
    // Format as "14 May"
    return DateFormat("d MMM").format(examDate);
  }
}
