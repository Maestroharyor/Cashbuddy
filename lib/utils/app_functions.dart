import 'package:intl/intl.dart';

String getTimeOfDay() {
  final currentHour = DateTime.now().hour;

  if (currentHour >= 4 && currentHour < 12) {
    return "Morning";
  } else if (currentHour >= 12 && currentHour < 17) {
    return "Afternoon";
  } else if (currentHour >= 17 && currentHour < 20) {
    return "Evening";
  } else {
    return "Night";
  }
}

DateTime getRandomDateBetweenYears(int startYear, int endYear) {
  final startDate = DateTime(startYear, 1, 1); // January 1st of the start year
  final endDate = DateTime(endYear, 12, 31); // December 31st of the end year

  final randomTime = DateTime.now().millisecondsSinceEpoch +
      DateTime.now().millisecondsSinceEpoch.hashCode *
          DateTime.now().millisecondsSinceEpoch.hashCode;
  final randomDate = DateTime.fromMillisecondsSinceEpoch(randomTime);

  return randomDate;
}

String formatCurrency(int amount) {
  final formatter = NumberFormat('#,##0', 'en_US');
  return formatter.format(amount);
}
