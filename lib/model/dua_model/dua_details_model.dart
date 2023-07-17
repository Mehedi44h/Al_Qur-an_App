class DuaDetailsModel {
  int? id;
  String? title;
  // int? duaSubCategoryId;
  String? audio;
  String? video;
  String? translation;
  String? transliteration;
  String? arabicDua;
  int? status;
  String? createdAt;
  String? updatedAt;

  DuaDetailsModel({
    this.id,
    this.title,
    this.audio,
    this.video,
    this.translation,
    this.transliteration,
    this.arabicDua,
  });

  DuaDetailsModel.fromJson(Map<dynamic, dynamic> json) {
    id = json['id'];
    title = json['title'];
    // duaSubCategoryId = json['dua_sub_category_id'];
    audio = json['audio'];
    video = json['video'];
    translation = json['translation'];
    transliteration = json['transliteration'];
    arabicDua = json['arabic_dua'];
  }
}
