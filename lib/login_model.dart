// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

LoginModel welcomeFromJson(String str) => LoginModel.fromJson(json.decode(str));

String welcomeToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  LoginModel({
    required this.accessToken,
    required this.tokenType,
    required this.expiresIn,
    required this.userName,
    required this.partnerId,
    required this.isDeliveryRep,
    required this.email,
    required this.isCustomer,
    required this.customerId,
    required this.issued,
    required this.expires,
  });

  String accessToken;
  String tokenType;
  int expiresIn;
  String userName;
  String partnerId;
  String isDeliveryRep;
  String email;
  String isCustomer;
  String customerId;
  String issued;
  String expires;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        accessToken: json["access_token"],
        tokenType: json["token_type"],
        expiresIn: json["expires_in"],
        userName: json["userName"],
        partnerId: json["PartnerId"],
        isDeliveryRep: json["IsDeliveryRep"],
        email: json["Email"],
        isCustomer: json["IsCustomer"],
        customerId: json["CustomerId"],
        issued: json[".issued"],
        expires: json[".expires"],
      );

  Map<String, dynamic> toJson() => {
        "access_token": accessToken,
        "token_type": tokenType,
        "expires_in": expiresIn,
        "userName": userName,
        "PartnerId": partnerId,
        "IsDeliveryRep": isDeliveryRep,
        "Email": email,
        "IsCustomer": isCustomer,
        "CustomerId": customerId,
        ".issued": issued,
        ".expires": expires,
      };
}
