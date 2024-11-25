class BatcherResponse {
  Response? response;
  Result? result;

  BatcherResponse({this.response, this.result});

  BatcherResponse.fromJson(Map<String, dynamic> json) {
    response = json['response'] != null
        ? new Response.fromJson(json['response'])
        : null;
    result =
        json['result'] != null ? new Result.fromJson(json['result']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.response != null) {
      data['response'] = this.response!.toJson();
    }
    if (this.result != null) {
      data['result'] = this.result!.toJson();
    }
    return data;
  }
}

class Response {
  int? responseCode;
  String? responseMessage;

  Response({this.responseCode, this.responseMessage});

  Response.fromJson(Map<String, dynamic> json) {
    responseCode = json['responseCode'];
    responseMessage = json['responseMessage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['responseCode'] = this.responseCode;
    data['responseMessage'] = this.responseMessage;
    return data;
  }
}

class Result {
  List<Weavingdata>? weavingdata;
  List<Spinningdata>? spinningdata;

  Result({this.weavingdata, this.spinningdata});

  Result.fromJson(Map<String, dynamic> json) {
    if (json['weavingdata'] != null) {
      weavingdata = <Weavingdata>[];
      json['weavingdata'].forEach((v) {
        weavingdata!.add(new Weavingdata.fromJson(v));
      });
    }
    if (json['spinningdata'] != null) {
      spinningdata = <Spinningdata>[];
      json['spinningdata'].forEach((v) {
        spinningdata!.add(new Spinningdata.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.weavingdata != null) {
      data['weavingdata'] = this.weavingdata!.map((v) => v.toJson()).toList();
    }
    if (this.spinningdata != null) {
      data['spinningdata'] = this.spinningdata!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Weavingdata {
  String? qualityCode;
  int? weaverPo;
  int? woNo;
  int? factoryInquiry;
  String? weaverName;
  List<WeaverIssueReceived>? weaverIssueReceived;

  Weavingdata(
      {this.qualityCode,
      this.weaverPo,
      this.woNo,
      this.factoryInquiry,
      this.weaverName,
      this.weaverIssueReceived});

  Weavingdata.fromJson(Map<String, dynamic> json) {
    qualityCode = json['quality_code'];
    weaverPo = json['weaver_po'];
    woNo = json['wo_no'];
    factoryInquiry = json['factory_inquiry'];
    weaverName = json['weaver_name'];
    if (json['weaverIssueReceived'] != null) {
      weaverIssueReceived = <WeaverIssueReceived>[];
      json['weaverIssueReceived'].forEach((v) {
        weaverIssueReceived!.add(new WeaverIssueReceived.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['quality_code'] = this.qualityCode;
    data['weaver_po'] = this.weaverPo;
    data['wo_no'] = this.woNo;
    data['factory_inquiry'] = this.factoryInquiry;
    data['weaver_name'] = this.weaverName;
    if (this.weaverIssueReceived != null) {
      data['weaverIssueReceived'] =
          this.weaverIssueReceived!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class WeaverIssueReceived {
  String? qualityCode;
  int? poNo;
  String? poDate;
  String? poTime;
  double? poIssueQty;
  double? poReceivedQty;
  String? poLastReceivingDate;

  WeaverIssueReceived(
      {this.qualityCode,
      this.poNo,
      this.poDate,
      this.poTime,
      this.poIssueQty,
      this.poReceivedQty,
      this.poLastReceivingDate});

  WeaverIssueReceived.fromJson(Map<String, dynamic> json) {
    qualityCode = json['quality_code'];
    poNo = json['po_no'];
    poDate = json['po_date'];
    poTime = json['po_time'];
    poIssueQty = json['po_issue_qty'];
    poReceivedQty = json['po_received_qty'];
    poLastReceivingDate = json['po_last_receiving_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['quality_code'] = this.qualityCode;
    data['po_no'] = this.poNo;
    data['po_date'] = this.poDate;
    data['po_time'] = this.poTime;
    data['po_issue_qty'] = this.poIssueQty;
    data['po_received_qty'] = this.poReceivedQty;
    data['po_last_receiving_date'] = this.poLastReceivingDate;
    return data;
  }
}

class Spinningdata {
  int? recordId;
  int? inquiryNo;
  String? qualityCode;
  int? wPo;
  int? custId;
  int? supplierCode;
  String? lotNo;
  String? yarnCode;
  String? weavingLocation;
  String? yarnDesc;
  String? yarnCount;
  int? yarnPly;
  int? bccFolio;
  String? fcStatus;
  String? yarnMkdt;

  Spinningdata(
      {this.recordId,
      this.inquiryNo,
      this.qualityCode,
      this.wPo,
      this.custId,
      this.supplierCode,
      this.lotNo,
      this.yarnCode,
      this.weavingLocation,
      this.yarnDesc,
      this.yarnCount,
      this.yarnPly,
      this.bccFolio,
      this.fcStatus,
      this.yarnMkdt});

  Spinningdata.fromJson(Map<String, dynamic> json) {
    recordId = json['record_id'];
    inquiryNo = json['inquiry_no'];
    qualityCode = json['quality_code'];
    wPo = json['w_po'];
    custId = json['cust_id'];
    supplierCode = json['supplier_code'];
    lotNo = json['lot_no'];
    yarnCode = json['yarn_code'];
    weavingLocation = json['weaving_location'];
    yarnDesc = json['yarn_desc'];
    yarnCount = json['yarn_count'];
    yarnPly = json['yarn_ply'];
    bccFolio = json['bcc_folio'];
    fcStatus = json['fc_status'];
    yarnMkdt = json['yarn_mkdt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['record_id'] = this.recordId;
    data['inquiry_no'] = this.inquiryNo;
    data['quality_code'] = this.qualityCode;
    data['w_po'] = this.wPo;
    data['cust_id'] = this.custId;
    data['supplier_code'] = this.supplierCode;
    data['lot_no'] = this.lotNo;
    data['yarn_code'] = this.yarnCode;
    data['weaving_location'] = this.weavingLocation;
    data['yarn_desc'] = this.yarnDesc;
    data['yarn_count'] = this.yarnCount;
    data['yarn_ply'] = this.yarnPly;
    data['bcc_folio'] = this.bccFolio;
    data['fc_status'] = this.fcStatus;
    data['yarn_mkdt'] = this.yarnMkdt;
    return data;
  }
}
