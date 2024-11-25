class SpinningData {
  SpinningData({
    required this.response,
    required this.result,
  });

  final Response? response;
  final Result? result;

  factory SpinningData.fromJson(Map<String, dynamic> json) {
    return SpinningData(
      response:
          json["response"] == null ? null : Response.fromJson(json["response"]),
      result: json["result"] == null ? null : Result.fromJson(json["result"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "response": response?.toJson(),
        "result": result?.toJson(),
      };
}

class Response {
  Response({
    required this.responseCode,
    required this.responseMessage,
  });

  final int? responseCode;
  final String? responseMessage;

  factory Response.fromJson(Map<String, dynamic> json) {
    return Response(
      responseCode: json["responseCode"],
      responseMessage: json["responseMessage"],
    );
  }

  Map<String, dynamic> toJson() => {
        "responseCode": responseCode,
        "responseMessage": responseMessage,
      };
}

class Result {
  Result({
    required this.dataList,
  });

  final List<DataList> dataList;

  factory Result.fromJson(Map<String, dynamic> json) {
    return Result(
      dataList: json["dataList"] == null
          ? []
          : List<DataList>.from(
              json["dataList"]!.map((x) => DataList.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "dataList": dataList.map((x) => x.toJson()).toList(),
      };
}

class DataList {
  DataList({
    this.recordId,
    this.inquiryNo,
    this.qualityCode,
    this.wPo,
    this.custId,
    this.supplierCode,
    this.lotNo,
    this.yarnCode,
    this.yarnMkdt,
    this.weavingLocation,
    this.yarnDesc,
    this.yarnCount,
    this.yarnPly,
    this.bccFolio,
    this.fcStatus,
  });

  final int? recordId;
  final int? inquiryNo;
  final String? qualityCode;
  final int? wPo;
  final int? custId;
  final int? supplierCode;
  final String? lotNo;
  final String? yarnCode;
  final DateTime? yarnMkdt;
  final String? weavingLocation;
  final String? yarnDesc;
  final String? yarnCount;
  final int? yarnPly;
  final int? bccFolio;
  final String? fcStatus;

  factory DataList.fromJson(Map<String, dynamic> json) {
    return DataList(
      recordId: json["record_id"],
      inquiryNo: json["inquiry_no"],
      qualityCode: json["quality_code"],
      wPo: json["w_po"],
      custId: json["cust_id"],
      supplierCode: json["supplier_code"],
      lotNo: json["lot_no"],
      yarnCode: json["yarn_code"],
      yarnMkdt: DateTime.tryParse(json["yarn_mkdt"] ?? ""),
      weavingLocation: json["weaving_location"],
      yarnDesc: json["yarn_desc"],
      yarnCount: json["yarn_count"],
      yarnPly: json["yarn_ply"],
      bccFolio: json["bcc_folio"],
      fcStatus: json["fc_status"],
    );
  }

  Map<String, dynamic> toJson() => {
        "record_id": recordId,
        "inquiry_no": inquiryNo,
        "quality_code": qualityCode,
        "w_po": wPo,
        "cust_id": custId,
        "supplier_code": supplierCode,
        "lot_no": lotNo,
        "yarn_code": yarnCode,
        "yarn_mkdt": yarnMkdt?.toIso8601String(),
        "weaving_location": weavingLocation,
        "yarn_desc": yarnDesc,
        "yarn_count": yarnCount,
        "yarn_ply": yarnPly,
        "bcc_folio": bccFolio,
        "fc_status": fcStatus,
      };
}
