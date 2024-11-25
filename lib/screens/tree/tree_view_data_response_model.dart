// To parse this JSON data, do
//
//     final treeViewDataResponseModel = treeViewDataResponseModelFromJson(jsonString);

import 'dart:convert';

import '../../helper/app_export.dart';

TreeViewDataResponseModel treeViewDataResponseModelFromJson(String str) =>
    TreeViewDataResponseModel.fromJson(json.decode(str));

String treeViewDataResponseModelToJson(TreeViewDataResponseModel data) =>
    json.encode(data.toJson());

class TreeViewDataResponseModel {
  TreeViewDataResponseModel({
    this.tree,
  });

  List<Tree>? tree;

  factory TreeViewDataResponseModel.fromJson(Map<String, dynamic> json) =>
      TreeViewDataResponseModel(
        tree: json["tree"] == null
            ? []
            : List<Tree>.from(json["tree"]!.map((x) => Tree.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "tree": tree == null
            ? []
            : List<dynamic>.from(tree!.map((x) => x.toJson())),
      };
}

class Tree {
  Tree({
    this.po,
    this.ordersheetnos,
  });

  String? po;
  List<Ordersheetno>? ordersheetnos;

  factory Tree.fromJson(Map<String, dynamic> json) => Tree(
        po: json["po"],
        ordersheetnos: json["ordersheetnos"] == null
            ? []
            : List<Ordersheetno>.from(
                json["ordersheetnos"]!.map((x) => Ordersheetno.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "po": po,
        "ordersheetnos": ordersheetnos == null
            ? []
            : List<dynamic>.from(ordersheetnos!.map((x) => x.toJson())),
      };
}

class Ordersheetno {
  Ordersheetno({
    this.osNo,
    this.shipments,
    this.qualityCodes,
  });

  int? osNo;
  List<Shipment>? shipments;
  List<QualityCode>? qualityCodes;

  factory Ordersheetno.fromJson(Map<String, dynamic> json) => Ordersheetno(
        osNo: json["os_no"],
        shipments: json["shipments"] == null
            ? []
            : List<Shipment>.from(
                json["shipments"]!.map((x) => Shipment.fromJson(x))),
        qualityCodes: json["qualityCodes"] == null
            ? []
            : List<QualityCode>.from(
                json["qualityCodes"]!.map((x) => QualityCode.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "os_no": osNo,
        "shipments": shipments == null
            ? []
            : List<dynamic>.from(shipments!.map((x) => x.toJson())),
        "qualityCodes": qualityCodes == null
            ? []
            : List<dynamic>.from(qualityCodes!.map((x) => x.toJson())),
      };
}

class QualityCode {
  QualityCode({
    this.qualityCode,
  });

  String? qualityCode;

  factory QualityCode.fromJson(Map<String, dynamic> json) => QualityCode(
        qualityCode: json["quality_code"],
      );

  Map<String, dynamic> toJson() => {
        "quality_code": qualityCode,
      };
}
