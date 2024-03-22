




import 'package:hive/hive.dart';
part 'prayer_model_now.g.dart';

@HiveType(typeId: 22)
class PrayerModelNow {
   @HiveField(0)
   final String prayerName ;
   @HiveField(1)
   final String prayerDate ;

  PrayerModelNow({required this.prayerName, required this.prayerDate});
}