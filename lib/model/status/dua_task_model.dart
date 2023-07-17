import 'dart:convert';

List<DuaaTasksModel> duaaTasksModelFromJson(String str) =>
    List<DuaaTasksModel>.from(
        json.decode(str).map((x) => DuaaTasksModel.fromJson(x)));

String duaaTasksModelToJson(List<DuaaTasksModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DuaaTasksModel {
  final int id;
  final String entryDate;
  final String entryTime;
  final String taskLevel;
  final String contentType;
  final String status;
  final String isExecuted;
  final String profileId;
  final String customerId;
  final String contentId;
  final dynamic executionTime;
  final dynamic executionDate;
  final List<Dua> duas;
  final List<Dua> lectures;

  DuaaTasksModel({
    required this.id,
    required this.entryDate,
    required this.entryTime,
    required this.taskLevel,
    required this.contentType,
    required this.status,
    required this.isExecuted,
    required this.profileId,
    required this.customerId,
    required this.contentId,
    required this.executionTime,
    required this.executionDate,
    required this.duas,
    required this.lectures,
  });

  factory DuaaTasksModel.fromJson(Map<String, dynamic> json) => DuaaTasksModel(
        id: json["id"],
        entryDate: json["entry_date"],
        entryTime: json["entry_time"],
        taskLevel: json["task_level"],
        contentType: json["content_type"],
        status: json["status"],
        isExecuted: json["isExecuted"],
        profileId: json["profile_id"],
        customerId: json["customer_id"],
        contentId: json["content_id"],
        executionTime: json["execution_time"],
        executionDate: json["execution_date"],
        duas: json["duas"] == null
            ? []
            : List<Dua>.from(json["duas"].map((x) => Dua.fromJson(x))),
        lectures: json["lectures"] == null
            ? []
            : List<Dua>.from(json["lectures"].map((x) => Dua.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "entry_date": entryDate,
        "entry_time": entryTime,
        "task_level": taskLevel,
        "content_type": contentType,
        "status": status,
        "isExecuted": isExecuted,
        "profile_id": profileId,
        "customer_id": customerId,
        "content_id": contentId,
        "execution_time": executionTime,
        "execution_date": executionDate,
        "duas": List<dynamic>.from(duas.map((x) => x.toJson())),
        "lectures": List<dynamic>.from(lectures.map((x) => x.toJson())),
      };
}

class Dua {
  final int id;
  final String title;
  final String audio;
  final String video;
  final String description;
  final String category;

  Dua({
    required this.id,
    required this.title,
    required this.audio,
    required this.video,
    required this.description,
    required this.category,
  });

  factory Dua.fromJson(Map<String, dynamic> json) => Dua(
        id: json["id"],
        title: json["title"] ?? '',
        audio: json["audio"] ?? '',
        video: json["video"] ?? '',
        description: json["description"] ?? '',
        category: json["category"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "audio": audio,
        "video": video,
        "description": description,
        "category": category,
      };
}
