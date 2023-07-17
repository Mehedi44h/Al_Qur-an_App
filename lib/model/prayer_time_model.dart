class PrayerTimeModel {
  String? fajr;
  String? dhuhr;
  String? asr;
  String? magrib;
  String? isha;
  String? sunRise;
  String? sunSet;

  PrayerTimeModel({
    required this.sunRise,
    required this.sunSet,
    required this.fajr,
    required this.dhuhr,
    required this.asr,
    required this.magrib,
    required this.isha,
  });

  factory PrayerTimeModel.fromJSON(Map<String, dynamic> json) {
    return PrayerTimeModel(
      sunRise: json['data']['timings']['Sunrise'],
      sunSet: json['data']['timings']['Sunset'],
      fajr: json['data']['timings']['Fajr'],
      dhuhr: json['data']['timings']['Dhuhr'],
      asr: json['data']['timings']['Asr'],
      magrib: json['data']['timings']['Maghrib'],
      isha: json['data']['timings']['Isha'],
    );
  }
}
