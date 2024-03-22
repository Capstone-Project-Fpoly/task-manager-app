import 'package:intl/intl.dart';

String formatDateTime(
  DateTime dateTime, {
  String format = 'dd MMM yyyy',
  String? locale = 'vi_VN',
}) {
  final formatter = DateFormat(format, locale);
  return formatter.format(dateTime);
}

DateTime parseDateString(
  String dateString, {
  String format = 'dd/MM/yyyy',
  String? locale = 'vi_VN',
}) {
  final formatter = DateFormat(format, locale);
  return formatter.parse(dateString);
}

String formatDateTimeNotification(
  String isoDateString, {
  String format = 'HH:mm, dd MMM',
  String? locale = 'vi_VN',
}) {
  try {
    final date = DateTime.parse(isoDateString);
    return DateFormat(format, locale).format(date);
  } catch (e) {
    return '';
  }
}

String formatDateTimeDetailCard(String stringDate) {
  try {
    if (stringDate == '') return stringDate;
    final DateTime dateTime =
        DateFormat('yyyy-MM-dd HH:mm:ss').parse(stringDate);
    final String time = DateFormat('dd/MM/yyyy').format(dateTime);
    stringDate = time;
    return stringDate;
  } catch (e) {
    return '';
  }
}

String formatDateTimeCommentCard(String stringDate) {
  try {
    if (stringDate == '') return stringDate;
    final DateTime dateTime = DateFormat('yyyy-MM-dd').parse(stringDate);
    final String time = DateFormat('dd/MM/yyyy').format(dateTime);
    stringDate = time;
    return stringDate;
  } catch (e) {
    return '';
  }
}
