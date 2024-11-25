import 'dart:convert';

LoginResponseModel loginResponseModelFromJson(String str) =>
    LoginResponseModel.fromJson(json.decode(str));

String loginResponseModelToJson(LoginResponseModel data) =>
    json.encode(data.toJson());

class LoginResponseModel {
  LoginResponseModel({
    this.info,
  });

  Info? info;

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      LoginResponseModel(
        info: Info.fromJson(json["info"]),
      );

  Map<String, dynamic> toJson() => {
        "info": info!.toJson(),
      };
}

class Info {
  Info(
      {this.userId,
      this.firstName,
      this.lastName,
      this.email,
      this.mobileNumber,
      this.countryCode,
      this.isforgotPassword});

  int? userId;
  String? firstName;
  String? lastName;
  String? email;
  String? mobileNumber;
  String? countryCode;
  bool? isforgotPassword;

  factory Info.fromJson(Map<String, dynamic> json) => Info(
      userId: json["userId"],
      firstName: json["firstName"],
      lastName: json["lastName"],
      email: json["email"],
      mobileNumber: json["mobileNumber"],
      countryCode: json["countryCode"],
      isforgotPassword: json["isforgotPassword"]);

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "mobileNumber": mobileNumber,
        "countryCode": countryCode,
        "isforgotPassword": isforgotPassword
      };
}
