class Bales {
  Bales({
    required this.response,
    required this.result,
  });

  final Response? response;
  final Result? result;

  factory Bales.fromJson(Map<String, dynamic> json) {
    return Bales(
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

  final List<DataListing> dataList;

  factory Result.fromJson(Map<String, dynamic> json) {
    return Result(
      dataList: json["dataList"] == null
          ? []
          : List<DataListing>.from(
              json["dataList"]!.map((x) => DataListing.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "dataList": dataList.map((x) => x.toJson()).toList(),
      };
}

class DataListing {
  DataListing({
    this.recordId,
    this.bccFolio,
    this.lotNo,
    this.lotCode,
    this.stationName,
    this.ginnerName,
    this.rbl,
    this.ibl,
  });

  final int? recordId;
  final int? bccFolio;
  final String? lotNo;
  final String? lotCode;
  final String? stationName;
  final String? ginnerName;
  final int? rbl;
  final int? ibl;

  factory DataListing.fromJson(Map<String, dynamic> json) {
    return DataListing(
      recordId: json["record_id"],
      bccFolio: json["bcc_folio"],
      lotNo: json["lot_no"],
      lotCode: json["lot_code"],
      stationName: json["station_name"],
      ginnerName: json["ginner_name"],
      rbl: json["rbl"],
      ibl: json["ibl"],
    );
  }

  Map<String, dynamic> toJson() => {
        "record_id": recordId,
        "bcc_folio": bccFolio,
        "lot_no": lotNo,
        "lot_code": lotCode,
        "station_name": stationName,
        "ginner_name": ginnerName,
        "rbl": rbl,
        "ibl": ibl,
      };
}
