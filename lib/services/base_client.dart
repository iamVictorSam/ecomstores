import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:ecomstore/services/app_exceptions.dart';

class BaseClient {
  static const int TIME_OUT_DURATION = 50;
  static const String baseUrl = 'https://wp-rest-service.herokuapp.com';

  // String _token = GetStorage().read('token');
  // Get
  Future<dynamic> get(String api) async {
    // ignore: non_constant_identifier_names
    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      // "Authorization": "Bearer $_token",
    };
    var url = Uri.parse(baseUrl + api);
    try {
      var response = await http.get(url, headers: requestHeaders).timeout(
            Duration(seconds: TIME_OUT_DURATION),
          );
      print(response.body);
      print(response.statusCode);
      return _processResponse(response);
    } on TimeoutException {
      ApiNotRespondingException('Session Timeout', url.toString());
    } on SocketException {
      throw FetchDataException('No Internet Connection', url.toString());
    }
  }

  // Post SignUP
  Future<dynamic> postSignUp(String api, dynamic payloadObj) async {
    var url = Uri.parse(baseUrl + api);
    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };

    var payload = json.encode(payloadObj);
    try {
      var response =
          await http.post(url, headers: requestHeaders, body: payload).timeout(
                Duration(seconds: TIME_OUT_DURATION),
              );
      print(response.statusCode);
      print(response.body);
      return _processResponse(response);
    } on TimeoutException {
      ApiNotRespondingException('Session Timeout', url.toString());
    } on SocketException {
      throw FetchDataException('No Internet Connection', url.toString());
    }
  }

  // PostOthers
  Future<dynamic> post(String api, dynamic payloadObj) async {
    // var _token = GetStorage().read('token');
    var url = Uri.parse(baseUrl + api);
    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      // "Authorization": "Bearer $_token",
    };

    var payload = json.encode(payloadObj);
    try {
      var response =
          await http.post(url, headers: requestHeaders, body: payload).timeout(
                Duration(seconds: TIME_OUT_DURATION),
              );
      print(response.statusCode);
      print(response.body);

      return _processResponse(response);
    } on TimeoutException {
      ApiNotRespondingException('Session Timeout', url.toString());
    } on SocketException {
      throw FetchDataException('No Internet Connection', url.toString());
    }
  }

  // Delete

  // Others
}

dynamic _processResponse(http.Response response) {
  switch (response.statusCode) {
    case 200:
      var responseJson = utf8.decode(response.bodyBytes);
      print(responseJson);
      return responseJson;
    case 201:
      var responseJson = utf8.decode(response.bodyBytes);
      print(responseJson);

      return responseJson;
    case 400:
      throw BadRequestException(
          utf8.decode(response.bodyBytes), response.request?.url.toString());
    case 401:
      throw UnprocessableEntity(
          utf8.decode(response.bodyBytes), response.request?.url.toString());
    case 403:
      throw UnAuthorizedException(
          utf8.decode(response.bodyBytes), response.request?.url.toString());
    case 404:
      throw PageNotFoundException(
          utf8.decode(response.bodyBytes), response.request?.url.toString());
    case 422:
      throw UnprocessableEntity(
          utf8.decode(response.bodyBytes), response.request?.url.toString());
    case 503:
      throw ServerException(
          utf8.decode(response.bodyBytes), response.request?.url.toString());
    case 500:
    default:
      throw UnAuthorizedException(
          'Error occured with code: ${response.statusCode} ${utf8.decode(response.bodyBytes)}',
          response.request?.url.toString());
  }
}
