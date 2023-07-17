import 'dart:convert';
import 'dart:core';

List<HajjExecutionModel> hajjExecutionModelFromJson(String str) =>
    List<HajjExecutionModel>.from(
        json.decode(str).map((x) => HajjExecutionModel.fromJson(x)));

String hajjExecutionModelToJson(List<HajjExecutionModel> data) =>
    json.encode(List<HajjExecutionModel>.from(data.map((x) => x.toJson())));

class HajjExecutionModel {
  final int id;
  final DateTime entryDate;
  final String taskLevel;
  final String status;
  final String isExecuted;
  final String profileId;
  final String customerId;
  final String sublistId;
  final String checklistId;
  final dynamic executionDate;
  final dynamic createdAt;
  final DateTime updatedAt;
  final String taskName;

  HajjExecutionModel({
    required this.id,
    required this.entryDate,
    required this.taskLevel,
    required this.status,
    required this.isExecuted,
    required this.profileId,
    required this.customerId,
    required this.sublistId,
    required this.checklistId,
    required this.executionDate,
    required this.createdAt,
    required this.updatedAt,
    required this.taskName,
  });

  factory HajjExecutionModel.fromJson(Map<String, dynamic> json) =>
      HajjExecutionModel(
        id: int.parse(json["id"].toString()),
        entryDate: DateTime.parse(json["entry_date"].toString()),
        taskLevel: json["task_level"],
        status: json["status"],
        isExecuted: json["isExecuted"],
        profileId: json["profile_id"],
        customerId: json["customer_id"],
        sublistId: json["sublist_id"],
        checklistId: json["checklist_id"],
        executionDate: json["execution_date"],
        createdAt: json["created_at"],
        updatedAt: DateTime.parse(json["updated_at"]),
        taskName: json["task_name"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "entry_date":
            "${entryDate.year.toString().padLeft(4, '0')}-${entryDate.month.toString().padLeft(2, '0')}-${entryDate.day.toString().padLeft(2, '0')}",
        "task_level": taskLevel,
        "status": status,
        "isExecuted": isExecuted,
        "profile_id": profileId,
        "customer_id": customerId,
        "sublist_id": sublistId,
        "checklist_id": checklistId,
        "execution_date": executionDate,
        "created_at": createdAt,
        "updated_at": updatedAt.toIso8601String(),
        "task_name": taskName,
      };
}
