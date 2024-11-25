// ignore_for_file: file_names, depend_on_referenced_packages, prefer_typing_uninitialized_variables, avoid_print

import 'dart:async';
import 'dart:developer';
import 'dart:io';
import '../helper/app_export.dart';
import 'package:http/http.dart' as http;

class ApiProvider {
  var headers = {
    "Ocp-Apim-Subscription-Key": "d524ef4c88ef42768bd2bab911a7a10a",
  };
  var headersObject = {
    "Content-Type": "application/json",
    "Ocp-Apim-Subscription-Key": "d524ef4c88ef42768bd2bab911a7a10a",
  };

  var timeout = const Duration(seconds: 60);

  ///** Error messages
  String timeoutMessage =
      // "Something went wrong, please check your internet and try again later.\n\nStatus Code : TO 001";
      "Please check your internet and try again later.";
  static var mainUrl = kReleaseMode
      ? "https://traceability.feroze1888.com:6023/api/"
      : "https://traceability.feroze1888.com:6023/api/";
  //Login
  static var logIn = "${mainUrl}Account/Login";
  //ForgotPassword


  static var forgotPassword = "${mainUrl}Account/ForgotPassword";
  //ChangePassword
  static var changePassword = "${mainUrl}Account/ChangePassword";
  //SearchOrderDataByNo
  static var searchOrderDataByNo = "${mainUrl}TraceMain/SearchByNumber";
  //GetShipments
  static var getShipments = "${mainUrl}TraceMain/GetShipments";
  //GetOrderStatus
  static var getOrderStatus = "${mainUrl}TraceMain/GetOrderStatus";
  //GetWeavingData
  static var getWeavingData = "${mainUrl}TraceMain/GetWeavingData";
  //GetDyeingData
  static var getDyeingData = "${mainUrl}TraceMain/GetDyeingData";
  //GetStichingData
  static var getStichingData = "${mainUrl}TraceMain/GetStichingData";
  //getTree
  static var getTree = "${mainUrl}TraceMain/GetTree";
  //getSpinningData
  static var batcherCodeData = "https://traceability.feroze1888.com:6023/api/TraceMain/GetInquiryDataByBatchNo?batchNo";
  static var getSpinningData = "${mainUrl}TraceMain/GetSpinningByInquiry";
  //   "https://traceability.feroze1888.com:6023/api/TraceMain/GetSpinningByInquiry";
  //"https://traceability.feroze1888.com:6023/api/TraceMain/GetSpinningByInquiry";
  static var getBalesData =
      "https://traceability.feroze1888.com:6023/api/TraceMain/GetSpinningDetailByfolioNo";
  Future<dynamic> get({required String url}) async {
    debugPrint("get url $url, headers $headers");
    var responseJson;
    try {
      final response =
          await http.get(Uri.parse(url), headers: headers).timeout(timeout);
      responseJson = _response(response);
      debugPrint("response get :$responseJson");
    } on SocketException {
      throw FetchDataException(
          "Please check your internet and try again later.");
    } on TimeoutException {
      throw TimeOutExceptionC(timeoutMessage);
    }
    return responseJson;
  }

  Future<dynamic> post({required String url, dynamic body}) async {
    debugPrint("url $url");

    var responseJson;
    try {
      final response = await http
          .post(
            Uri.parse(url),
            body: (body),
            headers: headers,
          )
          .timeout(timeout);
      responseJson = _response(response, url: url);
      log("response post $url : $responseJson");
    } on SocketException {
      throw FetchDataException(
          "Please check your internet and try again later.");
    } on TimeoutException {
      throw TimeOutExceptionC(timeoutMessage);
    }
    return responseJson;
  }

  Future<dynamic> postObject({required String url, dynamic body}) async {
    // print("postObject url $url, headers $headers");

    var responseJson;
    try {
      final response = await http
          .post(Uri.parse(url), body: json.encode(body), headers: headersObject)
          .timeout(timeout);
      // log("response postObject :${json.encode(body)}");
      responseJson = _response(response);
      log("response postObject :$responseJson");
    } on SocketException {
      throw FetchDataException(
          "Please check your internet and try again later.");
    } on TimeoutException {
      throw TimeOutExceptionC(timeoutMessage);
    }
    return responseJson;
  }

  dynamic _response(http.Response response, {String url = ""}) {
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body.toString());
        return responseJson;
      default:
        throw FetchDataException(
            "Something went wrong, please try again later.\n\nStatus Code : ${response.statusCode}");
    }
  }

}

class CustomException implements Exception {
  final _message;
  final _prefix;

  CustomException([this._message, this._prefix]);

  @override
  String toString() {
    return "$_prefix$_message";
  }
}

class FetchDataException extends CustomException {
  FetchDataException([String? message]) : super(message, "");
}

class BadRequestException extends CustomException {
  BadRequestException([message]) : super(message, "Invalid Request: ");
}

class UnauthorisedException extends CustomException {
  UnauthorisedException([message]) : super(message, "Unauthorised: ");
}

class InvalidInputException extends CustomException {
  InvalidInputException([String? message]) : super(message, "Invalid Input: ");
}

class TimeOutExceptionC extends CustomException {
  TimeOutExceptionC([String? message]) : super(message, "");
}
