// To parse this JSON data, do
//
//     final shipmentsDataResponseModel = shipmentsDataResponseModelFromJson(jsonString);

import 'dart:convert';

ShipmentsDataResponseModel shipmentsDataResponseModelFromJson(String str) =>
    ShipmentsDataResponseModel.fromJson(json.decode(str));

String shipmentsDataResponseModelToJson(ShipmentsDataResponseModel data) =>
    json.encode(data.toJson());

class ShipmentsDataResponseModel {
  ShipmentsDataResponseModel({
    this.shipments,
  });

  List<Shipment>? shipments;

  factory ShipmentsDataResponseModel.fromJson(Map<String, dynamic> json) =>
      ShipmentsDataResponseModel(
        shipments: json["shipments"] == null
            ? []
            : List<Shipment>.from(
                json["shipments"]!.map((x) => Shipment.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "shipments": shipments == null
            ? []
            : List<dynamic>.from(shipments!.map((x) => x.toJson())),
      };
}

class Shipment {
  Shipment({
    this.doNo,
    this.poNoBuyer,
    this.os,
    this.containerNo,
    this.cSizeDesc,
    this.dateOut,
    this.timeOut,
    this.quantityShippedInCartons,
    this.locPortName,
  });

  String? doNo;
  String? poNoBuyer;
  int? os;
  String? containerNo;
  String? cSizeDesc;
  DateTime? dateOut;
  String? timeOut;
  int? quantityShippedInCartons;
  String? locPortName;

  factory Shipment.fromJson(Map<String, dynamic> json) => Shipment(
        doNo: json["do_no"],
        poNoBuyer: json["po_no_buyer"],
        os: json["os"],
        containerNo: json["container_no"],
        cSizeDesc: json["c_size_desc"],
        dateOut:
            json["date_out"] == null ? null : DateTime.parse(json["date_out"]),
        timeOut: json["time_out"],
        quantityShippedInCartons: json["quantity_shipped_in_cartons"],
        locPortName: json["loc_port_name"],
      );

  Map<String, dynamic> toJson() => {
        "do_no": doNo,
        "po_no_buyer": poNoBuyer,
        "os": os,
        "container_no": containerNo,
        "c_size_desc": cSizeDesc,
        "date_out": dateOut?.toIso8601String(),
        "time_out": timeOut,
        "quantity_shipped_in_cartons": quantityShippedInCartons,
        "loc_port_name": locPortName,
      };
}
