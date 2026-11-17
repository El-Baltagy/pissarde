
import 'package:intl/intl.dart';

abstract class DateTimeHelper{
  static  String toHourMinute(String date) => date.length >= 5 ? date.substring(0, 5) : date;
  static String get formatDateOnly=>'dd/MM/yyyy';
 static String get formatTimeOnly=>'hh:mm';

 static  String  get formatDateFullMonth=> 'y,MMMM,d' ;
 static  String  get formatDateHalfMonth=> 'y MMM d' ;

   static String formatDateTimeFromString(String date,
 DateFormat  formatter ) {
      // DateFormat.yMMMMd()
     return formatter.format(DateTime.parse(date));
    /// for example convert this string date (“2024-03-15 14:30:00”) into Formatted Date: 2024/03/15 14:30
  }

  /// Returns localized weekday name for a day index (0 = Saturday ... 6 = Friday)
  /// using [DateFormat] from `intl` without hardcoding days.
  static String getWeekdayName(
    int dayIndex, {
    String? locale,
    bool isShort = true,
  }) {
    final normalizedDay = dayIndex % 7;
    // 2024-01-06 is a known Saturday (0 = Saturday, 1 = Sunday, ..., 6 = Friday)
    final referenceDate = DateTime(2024, 1, 6 + normalizedDay);
    final formatter = isShort ? DateFormat.E(locale) : DateFormat.EEEE(locale);
    return formatter.format(referenceDate);
  }

  static String? convertDateIntoCustomString(DateTime?  date){

     return date==null?null: "${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}";

  }

  //Format	 Output
// DateFormat('yyyy-MM-dd')	2026-07-12
// DateFormat('dd-MM-yyyy')	12-07-2026
// DateFormat('MM/dd/yyyy')	07/12/2026
// DateFormat('dd/MM/yyyy')	12/07/2026
// DateFormat('yyyy/MM/dd')	2026/07/12
// DateFormat('dd MMM yyyy')	12 Jul 2026
// DateFormat('MMMM dd, yyyy')	July 12, 2026
// DateFormat('EEE, dd MMM')	Sun, 12 Jul
// DateFormat('EEEE')	Sunday
// DateFormat('MMM')	Jul
// DateFormat('MMMM')	July
}