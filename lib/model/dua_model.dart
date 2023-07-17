// put the file in Model folder
class DuaModel {
  String? title;
  String? dua;
  String? duaTranslation;
  String? duaTransliteration;
  String? imgUrl;
  String? fazilat;
  String? description;
  bool istwo = true;

  DuaModel({
    required this.title,
    required this.dua,
    required this.duaTransliteration,
    required this.duaTranslation,
    this.imgUrl,
    required this.fazilat,
    this.description,
    this.istwo = true,
  });
}
