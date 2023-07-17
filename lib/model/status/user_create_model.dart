import 'dart:convert';

UserProfileModel userProfileModelFromJson(String str) =>
    UserProfileModel.fromJson(json.decode(str));

String userProfileModelToJson(UserProfileModel data) =>
    json.encode(data.toJson());

class UserProfileModel {
  bool success;
  List<Profile> profiles;

  UserProfileModel({
    required this.success,
    required this.profiles,
  });

  factory UserProfileModel.fromJson(Map<String, dynamic> json) =>
      UserProfileModel(
        success: json["success"],
        profiles: List<Profile>.from(
            json["profiles"].map((x) => Profile.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "profiles": List<dynamic>.from(profiles.map((x) => x.toJson())),
      };
}

class Profile {
  int id;
  String customerId;
  String name;
  String age;
  String country;
  String gender;
  DateTime createdAt;
  DateTime updatedAt;

  Profile({
    required this.id,
    required this.customerId,
    required this.name,
    required this.age,
    required this.country,
    required this.gender,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        id: json["id"],
        customerId: json["customer_id"],
        name: json["name"],
        age: json["age"],
        country: json["country"],
        gender: json["gender"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "customer_id": customerId,
        "name": name,
        "age": age,
        "country": country,
        "gender": gender,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
