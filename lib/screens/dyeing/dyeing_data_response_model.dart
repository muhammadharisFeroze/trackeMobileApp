// To parse this JSON data, do
//
//     final dyeingdataResponseModel = dyeingdataResponseModelFromJson(jsonString);

import 'dart:convert';

DyeingdataResponseModel dyeingdataResponseModelFromJson(String str) =>
    DyeingdataResponseModel.fromJson(json.decode(str));

String dyeingdataResponseModelToJson(DyeingdataResponseModel data) =>
    json.encode(data.toJson());

class DyeingdataResponseModel {
  DyeingdataResponseModel({
    this.dyeingData,
  });

  List<DyeingData>? dyeingData;

  factory DyeingdataResponseModel.fromJson(Map<String, dynamic> json) =>
      DyeingdataResponseModel(
        dyeingData: json["dyeingCount"] == null
            ? []
            : List<DyeingData>.from(
                json["dyeingCount"]!.map((x) => DyeingData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "dyeingCount": dyeingData == null
            ? []
            : List<dynamic>.from(dyeingData!.map((x) => x.toJson())),
      };
}

class DyeingData {
  DyeingData({
    this.osNo,
    this.qualityCode,
    this.colorCode,
    this.dProgramNo,
    this.dyerName,
    this.lotNo,
    this.dyeingIssueReceived,
  });

  int? osNo;
  String? qualityCode;
  String? colorCode;
  int? dProgramNo;
  String? dyerName;
  String? lotNo;
  List<DyeingIssueReceived>? dyeingIssueReceived;

  factory DyeingData.fromJson(Map<String, dynamic> json) => DyeingData(
        osNo: json["os_no"],
        qualityCode: json["quality_code"],
        colorCode: json["color_code"],
        dProgramNo: json["d_program_no"],
        dyerName: json["dyer_name"],
        lotNo: json["lot_no"],
        dyeingIssueReceived: json["dyeingIssueReceived"] == null
            ? []
            : List<DyeingIssueReceived>.from(json["dyeingIssueReceived"]!
                .map((x) => DyeingIssueReceived.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "os_no": osNo,
        "quality_code": qualityCode,
        "color_code": colorCode,
        "d_program_no": dProgramNo,
        "dyer_name": dyerName,
        "lot_no": lotNo,
        "dyeingIssueReceived": dyeingIssueReceived == null
            ? []
            : List<dynamic>.from(dyeingIssueReceived!.map((x) => x.toJson())),
      };
}

class DyeingIssueReceived {
  DyeingIssueReceived({
    this.qualityCode,
    this.oColorCode,
    this.receivedWeight,
    this.issuedWeight,
    this.lotStatus,
    this.lastReceivingDate,
    this.lotIssuedDate,
  });

  String? qualityCode;
  String? oColorCode;
  double? receivedWeight;
  double? issuedWeight;
  String? lotStatus;
  DateTime? lastReceivingDate;
  DateTime? lotIssuedDate;

  factory DyeingIssueReceived.fromJson(Map<String, dynamic> json) =>
      DyeingIssueReceived(
        qualityCode: json["quality_code"],
        oColorCode: json["o_color_code"],
        receivedWeight: json["received_weight"]?.toDouble(),
        issuedWeight: json["issued_weight"]?.toDouble(),
        lotStatus: json["lot_status"],
        lastReceivingDate: json["last_receiving_date"] == null
            ? null
            : DateTime.parse(json["last_receiving_date"]),
        lotIssuedDate: json["lot_issued_date"] == null
            ? null
            : DateTime.parse(json["lot_issued_date"]),
      );

  Map<String, dynamic> toJson() => {
        "quality_code": qualityCode,
        "o_color_code": oColorCode,
        "received_weight": receivedWeight,
        "issued_weight": issuedWeight,
        "lot_status": lotStatus,
        "last_receiving_date": lastReceivingDate?.toIso8601String(),
        "lot_issued_date": lotIssuedDate?.toIso8601String(),
      };
}
