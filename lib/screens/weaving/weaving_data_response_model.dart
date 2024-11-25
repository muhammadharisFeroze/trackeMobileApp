
import 'dart:convert';

WeavingdataResponseModel weavingdataResponseModelFromJson(String str) =>
    WeavingdataResponseModel.fromJson(json.decode(str));

String weavingdataResponseModelToJson(WeavingdataResponseModel data) =>
    json.encode(data.toJson());

class WeavingdataResponseModel {
  WeavingdataResponseModel({
    this.weavingdata,
  });

  List<WeavingData>? weavingdata;

  factory WeavingdataResponseModel.fromJson(Map<String, dynamic> json) =>
      WeavingdataResponseModel(
        weavingdata: json["weavingdata"] == null
            ? []
            : List<WeavingData>.from(
                json["weavingdata"]!.map((x) => WeavingData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "weavingdata": weavingdata == null
            ? []
            : List<dynamic>.from(weavingdata!.map((x) => x.toJson())),
      };
}

class WeavingData {
  WeavingData({
    this.qualityCode,
    this.weaverPo,
    this.woNo,
    this.factoryInquiry,
    this.weaverName,
    this.weaverIssueReceived,
  });

  String? qualityCode;
  int? weaverPo;
  int? woNo;
  int? factoryInquiry;
  String? weaverName;
  List<WeaverIssueReceived>? weaverIssueReceived;

  factory WeavingData.fromJson(Map<String, dynamic> json) => WeavingData(
        qualityCode: json["quality_code"],
        weaverPo: json["weaver_po"],
        woNo: json["wo_no"],
        factoryInquiry: json["factory_inquiry"],
        weaverName: json["weaver_name"],
        weaverIssueReceived: json["weaverIssueReceived"] == null
            ? []
            : List<WeaverIssueReceived>.from(json["weaverIssueReceived"]!
                .map((x) => WeaverIssueReceived.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "quality_code": qualityCode,
        "weaver_po": weaverPo,
        "wo_no": woNo,
        "factory_inquiry": factoryInquiry,
        "weaver_name": weaverName,
        "weaverIssueReceived": weaverIssueReceived == null
            ? []
            : List<dynamic>.from(weaverIssueReceived!.map((x) => x.toJson())),
      };
}

class WeaverIssueReceived {
  WeaverIssueReceived({
    this.qualityCode,
    this.poNo,
    this.poDate,
    this.poTime,
    this.poIssueQty,
    this.poReceivedQty,
    this.poLastReceivingDate,
  });

  String? qualityCode;
  int? poNo;
  DateTime? poDate;
  String? poTime;
  double? poIssueQty;
  double? poReceivedQty;
  DateTime? poLastReceivingDate;

  factory WeaverIssueReceived.fromJson(Map<String, dynamic> json) =>
      WeaverIssueReceived(
        qualityCode: json["quality_code"],
        poNo: json["po_no"],
        poDate:
            json["po_date"] == null ? null : DateTime.parse(json["po_date"]),
        poTime: json["po_time"],
        poIssueQty: json["po_issue_qty"]?.toDouble(),
        poReceivedQty: json["po_received_qty"],
        poLastReceivingDate: json["po_last_receiving_date"] == null
            ? null
            : DateTime.parse(json["po_last_receiving_date"]),
      );

  Map<String, dynamic> toJson() => {
        "quality_code": qualityCode,
        "po_no": poNo,
        "po_date": poDate?.toIso8601String(),
        "po_time": poTime,
        "po_issue_qty": poIssueQty,
        "po_received_qty": poReceivedQty,
        "po_last_receiving_date": poLastReceivingDate?.toIso8601String(),
      };
}
