import 'dart:convert';

SignInDataModel loginDataFromJson(String str) =>
    SignInDataModel.fromJson(json.decode(str));

String loginDataToJson(SignInDataModel data) => json.encode(data.toJson());

class SignInDataModel {
  SignInDataModel({
    required this.tokenType,
    required this.token,
    required this.message,
    required this.customer,
    required this.email_verified,
    this.subscriptionDetails,
  });

  String tokenType;
  String token;
  String message;
  Customer customer;
  SubscriptionDetails? subscriptionDetails;
  bool? email_verified;

  factory SignInDataModel.fromJson(Map<String, dynamic> json) =>
      SignInDataModel(
        tokenType: json["token_type"],
        token: json["token"],
        email_verified: json['email_verified'],
        message: json["message"],
        customer: Customer.fromJson(json["customer"]),
        subscriptionDetails: json["subscription_details"] == null
            ? null
            : SubscriptionDetails.fromJson(
                json["subscription_details"],
              ),
      );

  Map<dynamic, dynamic> toJson() => {
        "token_type": tokenType,
        "token": token,
        "message": message,
        "customer": customer.toJson(),
        "email_verified": email_verified,
        "subscription_details":
            subscriptionDetails == null ? null : subscriptionDetails!.toJson(),
      };
}

class Customer {
  Customer({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    this.loginType,
    this.userType,
    required this.status,
    this.emailVerifiedAt,
    this.rememberToken,
  });

  int id;
  String name;
  String email;
  String password;
  dynamic loginType;
  dynamic userType;
  String status;
  dynamic emailVerifiedAt;
  dynamic rememberToken;

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        password: json["password"],
        loginType: json["login_type"],
        userType: json["user_type"],
        status: json["status"],
        emailVerifiedAt: json["email_verified_at"],
        rememberToken: json["remember_token"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "password": password,
        "login_type": loginType,
        "user_type": userType,
        "status": status,
        "email_verified_at": emailVerifiedAt,
        "remember_token": rememberToken,
      };
}

class SubscriptionDetails {
  SubscriptionDetails({
    required this.id,
    required this.subscriptionName,
    required this.subscribeAmount,
    required this.email,
    required this.startingDate,
    required this.endingDate,
    required this.latestPurchaseDate,
    required this.requestDate,
    required this.customerDetailId,
    // required this.createdAt,
    // required this.updatedAt,
  });

  final int id;
  final String subscriptionName;
  final String subscribeAmount;
  final String email;
  final DateTime startingDate;
  final DateTime endingDate;
  final DateTime latestPurchaseDate;
  final DateTime requestDate;
  final String customerDetailId;
  // final DateTime createdAt;
  // final DateTime updatedAt;

  factory SubscriptionDetails.fromJson(Map<String, dynamic> json) =>
      SubscriptionDetails(
        id: json["id"],
        subscriptionName: json["subscription_name"],
        subscribeAmount: json["subscribe_amount"],
        email: json["email"],
        startingDate: DateTime.parse(json["starting_date"]),
        endingDate: DateTime.parse(json["ending_date"]),
        latestPurchaseDate: DateTime.parse(json["latest_purchase_date"]),
        requestDate: DateTime.parse(json["request_date"]),
        customerDetailId: json["customer_detail_id"],
        // createdAt: DateTime.parse(json["created_at"]),
        // updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "subscription_name": subscriptionName,
        "subscribe_amount": subscribeAmount,
        "email": email,
        "starting_date":
            "${startingDate.year.toString().padLeft(4, '0')}-${startingDate.month.toString().padLeft(2, '0')}-${startingDate.day.toString().padLeft(2, '0')}",
        "ending_date":
            "${endingDate.year.toString().padLeft(4, '0')}-${endingDate.month.toString().padLeft(2, '0')}-${endingDate.day.toString().padLeft(2, '0')}",
        "latest_purchase_date":
            "${latestPurchaseDate.year.toString().padLeft(4, '0')}-${latestPurchaseDate.month.toString().padLeft(2, '0')}-${latestPurchaseDate.day.toString().padLeft(2, '0')}",
        "request_date":
            "${requestDate.year.toString().padLeft(4, '0')}-${requestDate.month.toString().padLeft(2, '0')}-${requestDate.day.toString().padLeft(2, '0')}",
        "customer_detail_id": customerDetailId,
        // "created_at": createdAt.toIso8601String(),
        // "updated_at": updatedAt.toIso8601String(),
      };
}
