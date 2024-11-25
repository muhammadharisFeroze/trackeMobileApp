// // To parse this JSON data, do
// //
// //     final searchDataResponseModel = searchDataResponseModelFromJson(jsonString);

// import 'dart:convert';

// SearchDataResponseModel searchDataResponseModelFromJson(String str) =>
//     SearchDataResponseModel.fromJson(json.decode(str));

// String searchDataResponseModelToJson(SearchDataResponseModel data) =>
//     json.encode(data.toJson());

// class SearchDataResponseModel {
//   SearchDataResponseModel({
//     this.orderData,
//   });

//   List<OrderData>? orderData;

//   factory SearchDataResponseModel.fromJson(Map<String, dynamic> json) =>
//       SearchDataResponseModel(
//         orderData: json["orderData"] == null
//             ? []
//             : List<OrderData>.from(
//                 json["orderData"]!.map((x) => OrderData.fromJson(x))),
//       );

//   Map<String, dynamic> toJson() => {
//         "orderData": orderData == null
//             ? []
//             : List<dynamic>.from(orderData!.map((x) => x.toJson())),
//       };
// }

// class OrderData {
//   OrderData({
//     this.qualityCode,
//     this.inquiryNo,
//     this.customerPo,
//     this.poNoBuyer,
//     this.custName,
//     this.osNo,
//     this.oColorCode,
//     this.bItemNo,
//     this.packageCode,
//     this.orderQuantity,
//     this.deliveryQty,
//     this.woNo,
//     this.weaverName,
//     this.containerNo,
//     this.cSizeDesc,
//     this.doNo,
//     this.locPortName,
//     this.quantityShippedInCartons,
//     this.shipmentDatein,
//     this.shipmentDateout,
//     this.poDate,
//     this.poQty,
//     this.poReceivedQty,
//     this.lastReceivingDate,
//     this.lotNo,
//     this.dProgramNo,
//     this.dyerName,
//     this.orderQty,
//     this.auditedQuantity,
//     this.balanceToQc,
//     this.stitcherName,
//     this.stitchingStartDate,
//     this.lastQcPassedDate,
//     this.issuedWeight,
//     this.receivedWeight,
//     this.lotIssuedDate,
//     this.lastDyeReceivingDate,
//     this.lotStatus,
//   });

//   String? qualityCode;
//   String? inquiryNo;
//   String? customerPo;
//   String? poNoBuyer;
//   String? custName;
//   int? osNo;
//   String? oColorCode;
//   String? bItemNo;
//   String? packageCode;
//   int? orderQuantity;
//   int? deliveryQty;
//   int? woNo;
//   String? weaverName;
//   String? containerNo;
//   String? cSizeDesc;
//   String? doNo;
//   String? locPortName;
//   int? quantityShippedInCartons;
//   dynamic shipmentDatein;
//   dynamic shipmentDateout;
//   DateTime? poDate;
//   double? poQty;
//   double? poReceivedQty;
//   DateTime? lastReceivingDate;
//   String? lotNo;
//   int? dProgramNo;
//   String? dyerName;
//   double? orderQty;
//   double? auditedQuantity;
//   int? balanceToQc;
//   String? stitcherName;
//   dynamic stitchingStartDate;
//   dynamic lastQcPassedDate;
//   double? issuedWeight;
//   double? receivedWeight;
//   dynamic lotIssuedDate;
//   dynamic lastDyeReceivingDate;
//   String? lotStatus;

//   factory OrderData.fromJson(Map<String, dynamic> json) => OrderData(
//         qualityCode: json["quality_code"],
//         inquiryNo: json["inquiryNo"],
//         customerPo: json["customer_po"],
//         poNoBuyer: json["po_no_buyer"],
//         custName: json["cust_name"],
//         osNo: json["os_no"],
//         oColorCode: json["o_color_code"],
//         bItemNo: json["b_item_no"],
//         packageCode: json["package_code"],
//         orderQuantity: json["order_quantity"],
//         deliveryQty: json["delivery_qty"],
//         woNo: json["wo_no"],
//         weaverName: json["weaver_name"],
//         containerNo: json["container_no"],
//         cSizeDesc: json["c_size_desc"],
//         doNo: json["do_no"],
//         locPortName: json["loc_port_name"],
//         quantityShippedInCartons: json["quantity_shipped_in_cartons"],
//         shipmentDatein: json["shipment_datein"],
//         shipmentDateout: json["shipment_dateout"],
//         poDate:
//             json["po_date"] == null ? null : DateTime.parse(json["po_date"]),
//         poQty: json["po_qty"]?.toDouble(),
//         poReceivedQty: json["po_received_qty"],
//         lastReceivingDate: json["last_receiving_date"] == null
//             ? null
//             : DateTime.parse(json["last_receiving_date"]),
//         lotNo: json["lot_no"],
//         dProgramNo: json["d_program_no"],
//         dyerName: json["dyer_name"],
//         orderQty: json["order_qty"]?.toDouble(),
//         auditedQuantity: json["audited_quantity"]?.toDouble(),
//         balanceToQc: json["balance_to_qc"],
//         stitcherName: json["stitcher_name"],
//         stitchingStartDate: json["stitching_start_date"],
//         lastQcPassedDate: json["last_qc_passed_date"],
//         issuedWeight: json["issued_weight"]?.toDouble(),
//         receivedWeight: json["received_weight"]?.toDouble(),
//         lotIssuedDate: json["lot_issued_date"],
//         lastDyeReceivingDate: json["last_dye_receiving_date"],
//         lotStatus: json["lot_status"],
//       );

//   Map<String, dynamic> toJson() => {
//         "quality_code": qualityCode,
//         "inquiryNo": inquiryNo,
//         "customer_po": customerPo,
//         "po_no_buyer": poNoBuyer,
//         "cust_name": custName,
//         "os_no": osNo,
//         "o_color_code": oColorCode,
//         "b_item_no": bItemNo,
//         "package_code": packageCode,
//         "order_quantity": orderQuantity,
//         "delivery_qty": deliveryQty,
//         "wo_no": woNo,
//         "weaver_name": weaverName,
//         "container_no": containerNo,
//         "c_size_desc": cSizeDesc,
//         "do_no": doNo,
//         "loc_port_name": locPortName,
//         "quantity_shipped_in_cartons": quantityShippedInCartons,
//         "shipment_datein": shipmentDatein,
//         "shipment_dateout": shipmentDateout,
//         "po_date": poDate?.toIso8601String(),
//         "po_qty": poQty,
//         "po_received_qty": poReceivedQty,
//         "last_receiving_date": lastReceivingDate?.toIso8601String(),
//         "lot_no": lotNo,
//         "d_program_no": dProgramNo,
//         "dyer_name": dyerName,
//         "order_qty": orderQty,
//         "audited_quantity": auditedQuantity,
//         "balance_to_qc": balanceToQc,
//         "stitcher_name": stitcherName,
//         "stitching_start_date": stitchingStartDate,
//         "last_qc_passed_date": lastQcPassedDate,
//         "issued_weight": issuedWeight,
//         "received_weight": receivedWeight,
//         "lot_issued_date": lotIssuedDate,
//         "last_dye_receiving_date": lastDyeReceivingDate,
//         "lot_status": lotStatus,
//       };
// }

// To parse this JSON data, do
//
//     final searchDataResponseModel = searchDataResponseModelFromJson(jsonString);

// import 'dart:convert';

// SearchDataResponseModel searchDataResponseModelFromJson(String str) =>
//     SearchDataResponseModel.fromJson(json.decode(str));

// String searchDataResponseModelToJson(SearchDataResponseModel data) =>
//     json.encode(data.toJson());

// class SearchDataResponseModel {
//   SearchDataResponseModel({
//     this.orderData,
//   });

//   List<OrderData>? orderData;

//   factory SearchDataResponseModel.fromJson(Map<String, dynamic> json) =>
//       SearchDataResponseModel(
//         orderData: json["orderData"] == null
//             ? []
//             : List<OrderData>.from(
//                 json["orderData"]!.map((x) => OrderData.fromJson(x))),
//       );

//   Map<String, dynamic> toJson() => {
//         "orderData": orderData == null
//             ? []
//             : List<dynamic>.from(orderData!.map((x) => x.toJson())),
//       };
// }

// class OrderData {
//   OrderData({
//     this.qualityCode,
//     this.inquiryNo,
//     this.customerPo,
//     this.poNoBuyer,
//     this.custName,
//     this.osNo,
//     this.oColorCode,
//     this.bItemNo,
//     this.packageCode,
//     this.orderQuantity,
//     this.deliveryQty,
//     this.weaving,
//     this.shipments,
//   });

//   String? qualityCode;
//   String? inquiryNo;
//   String? customerPo;
//   String? poNoBuyer;
//   String? custName;
//   int? osNo;
//   String? oColorCode;
//   String? bItemNo;
//   String? packageCode;
//   int? orderQuantity;
//   int? deliveryQty;
//   List<Weaving>? weaving;
//   List<Shipment>? shipments;

//   factory OrderData.fromJson(Map<String, dynamic> json) => OrderData(
//         qualityCode: json["quality_code"],
//         inquiryNo: json["inquiryNo"],
//         customerPo: json["customer_po"],
//         poNoBuyer: json["po_no_buyer"],
//         custName: json["cust_name"],
//         osNo: json["os_no"],
//         oColorCode: json["o_color_code"],
//         bItemNo: json["b_item_no"],
//         packageCode: json["package_code"],
//         orderQuantity: json["order_quantity"],
//         deliveryQty: json["delivery_qty"],
//         weaving: json["weaving"] == null
//             ? []
//             : List<Weaving>.from(
//                 json["weaving"]!.map((x) => Weaving.fromJson(x))),
//         shipments: json["shipments"] == null
//             ? []
//             : List<Shipment>.from(
//                 json["shipments"]!.map((x) => Shipment.fromJson(x))),
//       );

//   Map<String, dynamic> toJson() => {
//         "quality_code": qualityCode,
//         "inquiryNo": inquiryNo,
//         "customer_po": customerPo,
//         "po_no_buyer": poNoBuyer,
//         "cust_name": custName,
//         "os_no": osNo,
//         "o_color_code": oColorCode,
//         "b_item_no": bItemNo,
//         "package_code": packageCode,
//         "order_quantity": orderQuantity,
//         "delivery_qty": deliveryQty,
//         "weaving": weaving == null
//             ? []
//             : List<dynamic>.from(weaving!.map((x) => x.toJson())),
//         "shipments": shipments == null
//             ? []
//             : List<dynamic>.from(shipments!.map((x) => x.toJson())),
//       };
// }

// class Shipment {
//   Shipment({
//     this.osNo,
//     this.packageCode,
//     this.poNoBuyer,
//     this.containerNo,
//     this.cSizeDesc,
//     this.dateIn,
//     this.dateOut,
//     this.doNo,
//     this.locPortName,
//     this.quantityShippedInCartons,
//     this.stichingDetail,
//   });

//   int? osNo;
//   String? packageCode;
//   String? poNoBuyer;
//   String? containerNo;
//   String? cSizeDesc;
//   DateTime? dateIn;
//   DateTime? dateOut;
//   String? doNo;
//   String? locPortName;
//   int? quantityShippedInCartons;
//   List<dynamic>? stichingDetail;

//   factory Shipment.fromJson(Map<String, dynamic> json) => Shipment(
//         osNo: json["os_no"],
//         packageCode: json["package_code"],
//         poNoBuyer: json["po_no_buyer"],
//         containerNo: json["container_no"],
//         cSizeDesc: json["c_size_desc"],
//         dateIn:
//             json["date_in"] == null ? null : DateTime.parse(json["date_in"]),
//         dateOut:
//             json["date_out"] == null ? null : DateTime.parse(json["date_out"]),
//         doNo: json["do_no"],
//         locPortName: json["loc_port_name"],
//         quantityShippedInCartons: json["quantity_shipped_in_cartons"],
//         stichingDetail: json["stichingDetail"] == null
//             ? []
//             : List<dynamic>.from(json["stichingDetail"]!.map((x) => x)),
//       );

//   Map<String, dynamic> toJson() => {
//         "os_no": osNo,
//         "package_code": packageCode,
//         "po_no_buyer": poNoBuyer,
//         "container_no": containerNo,
//         "c_size_desc": cSizeDesc,
//         "date_in": dateIn?.toIso8601String(),
//         "date_out": dateOut?.toIso8601String(),
//         "do_no": doNo,
//         "loc_port_name": locPortName,
//         "quantity_shipped_in_cartons": quantityShippedInCartons,
//         "stichingDetail": stichingDetail == null
//             ? []
//             : List<dynamic>.from(stichingDetail!.map((x) => x)),
//       };
// }

// class Weaving {
//   Weaving({
//     this.inquiryNo,
//     this.woNo,
//     this.weaverName,
//     this.qualityCode,
//     this.weaverPo,
//     this.poIssueReceive,
//   });

//   int? inquiryNo;
//   int? woNo;
//   String? weaverName;
//   String? qualityCode;
//   int? weaverPo;
//   List<PoIssueReceive>? poIssueReceive;

//   factory Weaving.fromJson(Map<String, dynamic> json) => Weaving(
//         inquiryNo: json["inquiryNo"],
//         woNo: json["wo_no"],
//         weaverName: json["weaver_name"],
//         qualityCode: json["quality_code"],
//         weaverPo: json["weaver_po"],
//         poIssueReceive: json["poIssueReceive"] == null
//             ? []
//             : List<PoIssueReceive>.from(
//                 json["poIssueReceive"]!.map((x) => PoIssueReceive.fromJson(x))),
//       );

//   Map<String, dynamic> toJson() => {
//         "inquiryNo": inquiryNo,
//         "wo_no": woNo,
//         "weaver_name": weaverName,
//         "quality_code": qualityCode,
//         "weaver_po": weaverPo,
//         "poIssueReceive": poIssueReceive == null
//             ? []
//             : List<dynamic>.from(poIssueReceive!.map((x) => x.toJson())),
//       };
// }

// class PoIssueReceive {
//   PoIssueReceive({
//     this.poNo,
//     this.qualityCode,
//     this.poDate,
//     this.poQty,
//     this.poReceivedQty,
//     this.lastReceivingDate,
//     this.dyeingDetail,
//   });

//   int? poNo;
//   String? qualityCode;
//   DateTime? poDate;
//   double? poQty;
//   double? poReceivedQty;
//   DateTime? lastReceivingDate;
//   List<dynamic>? dyeingDetail;

//   factory PoIssueReceive.fromJson(Map<String, dynamic> json) => PoIssueReceive(
//         poNo: json["po_no"],
//         qualityCode: json["quality_code"],
//         poDate:
//             json["po_date"] == null ? null : DateTime.parse(json["po_date"]),
//         poQty: json["po_qty"]?.toDouble(),
//         poReceivedQty: json["po_received_qty"]?.toDouble(),
//         lastReceivingDate: json["last_receiving_date"] == null
//             ? null
//             : DateTime.parse(json["last_receiving_date"]),
//         dyeingDetail: json["dyeingDetail"] == null
//             ? []
//             : List<dynamic>.from(json["dyeingDetail"]!.map((x) => x)),
//       );

//   Map<String, dynamic> toJson() => {
//         "po_no": poNo,
//         "quality_code": qualityCode,
//         "po_date": poDate?.toIso8601String(),
//         "po_qty": poQty,
//         "po_received_qty": poReceivedQty,
//         "last_receiving_date": lastReceivingDate?.toIso8601String(),
//         "dyeingDetail": dyeingDetail == null
//             ? []
//             : List<dynamic>.from(dyeingDetail!.map((x) => x)),
//       };
// }
// To parse this JSON data, do
//
//     final searchDataResponseModel = searchDataResponseModelFromJson(jsonString);

import 'dart:convert';

SearchDataResponseModel searchDataResponseModelFromJson(String str) =>
    SearchDataResponseModel.fromJson(json.decode(str));

String searchDataResponseModelToJson(SearchDataResponseModel data) =>
    json.encode(data.toJson());

class SearchDataResponseModel {
  SearchDataResponseModel({
    this.orderData,
  });

  List<OrderData>? orderData;

  factory SearchDataResponseModel.fromJson(Map<String, dynamic> json) =>
      SearchDataResponseModel(
        orderData: json["orderData"] == null
            ? []
            : List<OrderData>.from(
                json["orderData"]!.map((x) => OrderData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "orderData": orderData == null
            ? []
            : List<dynamic>.from(orderData!.map((x) => x.toJson())),
      };
}

class OrderData {
  OrderData({
    this.inquiryNo,
    this.customerPo,
    this.poNoBuyer,
    this.custName,
    this.osNo,
    this.oColorCode,
    this.bItemNo,
    this.packageCode,
    this.shipments,
    this.qualitycodes,
  });

  String? inquiryNo;
  String? customerPo;
  String? poNoBuyer;
  String? custName;
  int? osNo;
  String? oColorCode;
  String? bItemNo;
  String? packageCode;
  int? shipments;
  List<Qualitycode>? qualitycodes;

  factory OrderData.fromJson(Map<String, dynamic> json) => OrderData(
        inquiryNo: json["inquiryNo"],
        customerPo: json["customer_po"],
        poNoBuyer: json["po_no_buyer"],
        custName: json["cust_name"],
        osNo: json["os_no"],
        oColorCode: json["o_color_code"],
        bItemNo: json["b_item_no"],
        packageCode: json["package_code"],
        shipments: json["shipments"],
        qualitycodes: json["qualitycodes"] == null
            ? []
            : List<Qualitycode>.from(
                json["qualitycodes"]!.map((x) => Qualitycode.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "inquiryNo": inquiryNo,
        "customer_po": customerPo,
        "po_no_buyer": poNoBuyer,
        "cust_name": custName,
        "os_no": osNo,
        "o_color_code": oColorCode,
        "b_item_no": bItemNo,
        "package_code": packageCode,
        "shipments": shipments,
        "qualitycodes": qualitycodes == null
            ? []
            : List<dynamic>.from(qualitycodes!.map((x) => x.toJson())),
      };
}

class Qualitycode {
  Qualitycode({
    this.qualityCode,
    this.orderQuantity,
    this.deliveryQty,
    this.image,
  });

  String? qualityCode;
  int? orderQuantity;
  int? deliveryQty;
  String? image;

  factory Qualitycode.fromJson(Map<String, dynamic> json) => Qualitycode(
        qualityCode: json["quality_code"],
        orderQuantity: json["order_quantity"],
        deliveryQty: json["delivery_qty"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "quality_code": qualityCode,
        "order_quantity": orderQuantity,
        "delivery_qty": deliveryQty,
        "image": image,
      };
}
