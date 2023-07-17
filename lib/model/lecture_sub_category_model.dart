import 'dart:convert';

List<LectureSubcategoryListModel?>? lectureSubcategoryLIstModelFromJson(
        String str) =>
    json.decode(str) == null
        ? []
        : List<LectureSubcategoryListModel?>.from(json
            .decode(str)!
            .map((x) => LectureSubcategoryListModel.fromJson(x)));

String lectureSubcategoryLIstModelToJson(
        List<LectureSubcategoryListModel?>? data) =>
    json.encode(
        data == null ? [] : List<dynamic>.from(data.map((x) => x!.toJson())));

class LectureSubcategoryListModel {
  LectureSubcategoryListModel({
    this.id,
    this.title,
    this.audio,
    this.description,
    this.video,
    //this.category,
  });

  int? id;
  String? title;
  String? audio;
  String? description;
  String? video;
  //int? category;

  factory LectureSubcategoryListModel.fromJson(Map<dynamic, dynamic> json) =>
      LectureSubcategoryListModel(
        id: json["id"],
        title: json["title"],
        audio: json["audio"],
        description: json["description"],
        video: json["video"],
        //category: json["category"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "audio": audio,
        "description": description,
        "video": video,
        //"category": category,
      };
}
