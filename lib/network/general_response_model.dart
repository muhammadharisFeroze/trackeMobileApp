import 'package:feroze_mills/screens/spinning/spinning_data_response_model.dart';

import '../helper/app_export.dart';

class GeneralResponseModel<T> {
  Response? response;
  T? result;
  dynamic resultNoModel;
  List<T>? resultList;
  GeneralResponseModel({this.response, this.result});
  GeneralResponseModel.fromJson(Map<String, dynamic> json) {
    response =
        json['response'] != null ? Response.fromJson(json['response']) : null;
    resultNoModel = json['result'];
    try {
      if (T == LoginResponseModel) {
        result = json['result'] != null
            ? (LoginResponseModel.fromJson(json['result']) as T)
            : null;
      }
      if (T == SpinningData) {
        result = json['result'] != null
            ? (SpinningData.fromJson(json['result']) as T)
            : null;
      }

      if (T == SearchDataResponseModel) {
        result = json['result'] != null
            ? (SearchDataResponseModel.fromJson(json['result']) as T)
            : null;
      }
      if (T == ShipmentsDataResponseModel) {
        result = json['result'] != null
            ? (ShipmentsDataResponseModel.fromJson(json['result']) as T)
            : null;
      }
      if (T == WeavingdataResponseModel) {
        result = json['result'] != null
            ? (WeavingdataResponseModel.fromJson(json['result']) as T)
            : null;
      }
      if (T == DyeingdataResponseModel) {
        result = json['result'] != null
            ? (DyeingdataResponseModel.fromJson(json['result']) as T)
            : null;
      }
      if (T == StichingDataResponseModel) {
        result = json['result'] != null
            ? (StichingDataResponseModel.fromJson(json['result']) as T)
            : null;
      }
      if (T == TreeViewDataResponseModel) {
        result = json['result'] != null
            ? (TreeViewDataResponseModel.fromJson(json['result']) as T)
            : null;
      }
    } catch (e) {
      debugPrint("Exception $e");
      result = null;
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (response != null) {
      data['response'] = response?.toJson();
    }
    if (result != null) {
      // data['result'] = this.result.toJson();
      // data['result'] = this.result.toJson();
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['responseCode'] = responseCode;
    data['responseMessage'] = responseMessage;
    return data;
  }
}
