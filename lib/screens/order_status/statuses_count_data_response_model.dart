// To parse this JSON data, do
//
//     final statusesCountDataResponseModel = statusesCountDataResponseModelFromJson(jsonString);

import 'dart:convert';

StatusesCountDataResponseModel statusesCountDataResponseModelFromJson(
        String str) =>
    StatusesCountDataResponseModel.fromJson(json.decode(str));

String statusesCountDataResponseModelToJson(
        StatusesCountDataResponseModel data) =>
    json.encode(data.toJson());

class StatusesCountDataResponseModel {
  StatusesCountDataResponseModel({
    this.response,
    this.result,
  });

  Response? response;
  Result? result;

  factory StatusesCountDataResponseModel.fromJson(Map<String, dynamic> json) =>
      StatusesCountDataResponseModel(
        response: json["response"] == null
            ? null
            : Response.fromJson(json["response"]),
        result: json["result"] == null ? null : Result.fromJson(json["result"]),
      );

  Map<String, dynamic> toJson() => {
        "response": response?.toJson(),
        "result": result?.toJson(),
      };
}

class Response {
  Response({
    this.responseCode,
    this.responseMessage,
  });

  int? responseCode;
  String? responseMessage;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
        responseCode: json["responseCode"],
        responseMessage: json["responseMessage"],
      );

  Map<String, dynamic> toJson() => {
        "responseCode": responseCode,
        "responseMessage": responseMessage,
      };
}

class Result {
  Result({
    this.statusesCount,
  });

  StatusesCount? statusesCount;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        statusesCount: json["statusesCount"] == null
            ? null
            : StatusesCount.fromJson(json["statusesCount"]),
      );

  Map<String, dynamic> toJson() => {
        "statusesCount": statusesCount?.toJson(),
      };
}

class StatusesCount {
  StatusesCount({
    this.weavingCount,
    this.dyeingCount,
    this.stichingCount,
    this.spinningCount,
  });

  int? weavingCount;
  int? dyeingCount;
  int? stichingCount;
  int? spinningCount;

  factory StatusesCount.fromJson(Map<String, dynamic> json) => StatusesCount(
        weavingCount: json["weavingCount"],
        dyeingCount: json["dyeingCount"],
        stichingCount: json["stichingCount"],
        spinningCount: json["spinningCount"],
      );

  Map<String, dynamic> toJson() => {
        "weavingCount": weavingCount,
        "dyeingCount": dyeingCount,
        "stichingCount": stichingCount,
        "spinningCount": spinningCount,
      };
}
