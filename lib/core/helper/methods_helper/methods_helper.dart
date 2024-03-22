



import 'package:easy_localization/easy_localization.dart';

abstract class MethodsHelper {
   static String getMonthNow () => DateFormat.M().format(DateTime.now()); 
   static String getYearAndMoth () => DateFormat.yM().format(DateTime.now());
   static String getTimeNowIn24 () => DateFormat('HH:mm').format(DateTime.now());
   static DateTime parseTimeIn24 (String time) => DateFormat('HH:mm').parse(time);

}