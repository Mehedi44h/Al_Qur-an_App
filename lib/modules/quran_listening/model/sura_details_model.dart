class SuraDetailsModel {
  SuraDetailsModel({
    required this.result,
  });
  late final List<Result> result;

  SuraDetailsModel.fromJson(Map<String, dynamic> json) {
    result = List.from(json['result']).map((e) => Result.fromJson(e)).toList();
  }
}

class Result {
  Result({
    required this.id,
    required this.sura,
    required this.aya,
    required this.arabicText,
    required this.translation,
    required this.footnotes,
  });
  late final String id;
  late final String sura;
  late final String aya;
  late final String arabicText;
  late final String translation;
  late final String footnotes;

  Result.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? '';
    sura = json['sura'] ?? '';
    aya = json['aya'] ?? '';
    arabicText = json['arabic_text'] ?? '';
    translation = json['translation'] ?? '';
    footnotes = json['footnotes'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['sura'] = sura;
    data['aya'] = aya;
    data['arabic_text'] = arabicText;
    data['translation'] = translation;
    data['footnotes'] = footnotes;
    return data;
  }
}
