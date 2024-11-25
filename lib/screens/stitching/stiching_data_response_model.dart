// To parse this JSON data, do
//
//     final stichingDataResponseModel = stichingDataResponseModelFromJson(jsonString);

import 'dart:convert';

StichingDataResponseModel stichingDataResponseModelFromJson(String str) =>
    StichingDataResponseModel.fromJson(json.decode(str));

String stichingDataResponseModelToJson(StichingDataResponseModel data) =>
    json.encode(data.toJson());

class StichingDataResponseModel {
  StichingDataResponseModel({
    this.stichingData,
  });

  List<StichingData>? stichingData;

  factory StichingDataResponseModel.fromJson(Map<String, dynamic> json) =>
      StichingDataResponseModel(
        stichingData: json["stichingCount"] == null
            ? []
            : List<StichingData>.from(
                json["stichingCount"]!.map((x) => StichingData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "stichingCount": stichingData == null
            ? []
            : List<dynamic>.from(stichingData!.map((x) => x.toJson())),
      };
}

class StichingData {
  StichingData({
    this.osNo,
    this.packageCode,
    this.orderQty,
    this.auditedQuantity,
    this.stitchingStartDate,
    this.lastQcPassedDate,
    this.stitcherName,
    this.balanceToQc,
  });

  int? osNo;
  String? packageCode;
  int? orderQty;
  int? auditedQuantity;
  DateTime? stitchingStartDate;
  DateTime? lastQcPassedDate;
  String? stitcherName;
  int? balanceToQc;

  factory StichingData.fromJson(Map<String, dynamic> json) => StichingData(
        osNo: json["os_no"],
        packageCode: json["package_code"],
        orderQty: json["order_qty"],
        auditedQuantity: json["audited_quantity"],
        stitchingStartDate: json["stitching_start_date"] == null
            ? null
            : DateTime.parse(json["stitching_start_date"]),
        lastQcPassedDate: json["last_qc_passed_date"] == null
            ? null
            : DateTime.parse(json["last_qc_passed_date"]),
        stitcherName: json["stitcher_name"],
        balanceToQc: json["balance_to_qc"],
      );

  Map<String, dynamic> toJson() => {
        "os_no": osNo,
        "package_code": packageCode,
        "order_qty": orderQty,
        "audited_quantity": auditedQuantity,
        "stitching_start_date": stitchingStartDate?.toIso8601String(),
        "last_qc_passed_date": lastQcPassedDate?.toIso8601String(),
        "stitcher_name": stitcherName,
        "balance_to_qc": balanceToQc,
      };
}
