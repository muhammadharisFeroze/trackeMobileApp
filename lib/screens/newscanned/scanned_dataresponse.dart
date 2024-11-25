
class ApiResponse {
  final Response? response;
  final Result? result;

  ApiResponse({this.response, this.result});

  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    return ApiResponse(
      response: Response.fromJson(json['response']),
      result: Result.fromJson(json['result']),
    );
  }
}

class Response {
  final int responseCode;
  final String responseMessage;

  Response({required this.responseCode, required this.responseMessage});

  factory Response.fromJson(Map<String, dynamic> json) {
    return Response(
      responseCode: json['responseCode'],
      responseMessage: json['responseMessage'],
    );
  }
}

class Result {
  final List<TracespnDetail> tracespnDetails;
  final List<InquiryDetail> inquiryDetails;

  Result({required this.tracespnDetails, required this.inquiryDetails});

  factory Result.fromJson(Map<String, dynamic> json) {
    var tracespnDetailsList = json['tracespnDetails'] as List;
    var inquiryDetailsList = json['inquiryDetails'] as List;

    List<TracespnDetail> tracespnDetails = tracespnDetailsList
        .map((detail) => TracespnDetail.fromJson(detail))
        .toList();

    List<InquiryDetail> inquiryDetails = inquiryDetailsList
        .map((detail) => InquiryDetail.fromJson(detail))
        .toList();

    return Result(
      tracespnDetails: tracespnDetails,
      inquiryDetails: inquiryDetails,
    );
  }
}

class TracespnDetail {
  final int? recordId;
  final int? bccFolio;
  final String? lotNo;
  final String? lotCode;
  final String? stationName;
  final String? ginnerName;
  final int? rbl;
  final int? ibl;

  TracespnDetail({
    this.recordId,
    this.bccFolio,
    this.lotNo,
    this.lotCode,
    this.stationName,
    this.ginnerName,
    this.rbl,
    this.ibl,
  });

  factory TracespnDetail.fromJson(Map<String, dynamic> json) {
    return TracespnDetail(
      recordId: json['record_id'],
      bccFolio: json['bcc_folio'],
      lotNo: json['lot_no'],
      lotCode: json['lot_code'],
      stationName: json['station_name'],
      ginnerName: json['ginner_name'],
      rbl: json['rbl'],
      ibl: json['ibl'],
    );
  }
}

class InquiryDetail {
  final int? recordId;
  final String? factoryInquiry;
  final String? customerPo;
  final String? poNoBuyer;
  final String? custName;
  final int? osNo;
  final String? qualityCode;
  final String? oColorCode;
  final String? bItemNo;
  final String? packageCode;
  final int? orderQuantity;
  final int? deliveryQty;

  InquiryDetail({
    this.recordId,
    this.factoryInquiry,
    this.customerPo,
    this.poNoBuyer,
    this.custName,
    this.osNo,
    this.qualityCode,
    this.oColorCode,
    this.bItemNo,
    this.packageCode,
    this.orderQuantity,
    this.deliveryQty,
  });

  factory InquiryDetail.fromJson(Map<String, dynamic> json) {
    return InquiryDetail(
      recordId: json['record_id'],
      factoryInquiry: json['factory_inquiry'],
      customerPo: json['customer_po'],
      poNoBuyer: json['po_no_buyer'],
      custName: json['cust_name'],
      osNo: json['os_no'],
      qualityCode: json['quality_code'],
      oColorCode: json['o_color_code'],
      bItemNo: json['b_item_no'],
      packageCode: json['package_code'],
      orderQuantity: json['order_quantity'],
      deliveryQty: json['delivery_qty'],
    );
  }
}
