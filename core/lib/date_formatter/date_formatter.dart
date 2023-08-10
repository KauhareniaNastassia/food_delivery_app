class DateFormatter {
  String formatDateString(String dateString) {
    final DateTime dateTime = DateTime.parse(dateString);
    final String formattedDate =
        '${dateTime.year}/${dateTime.month.toString().padLeft(2, '0')}'
        '/${dateTime.day.toString().padLeft(2, '0')} '
        '${dateTime.hour.toString().padLeft(2, '0')}:'
        '${dateTime.minute.toString().padLeft(2, '0')}:'
        '${dateTime.second.toString().padLeft(2, '0')}';
    return formattedDate;
  }
}
