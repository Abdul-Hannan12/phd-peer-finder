import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'app_exceptions.dart';
import 'base_api_service.dart';
import 'package:http/http.dart' as http;

class NetworkApiServices extends BaseApiServices {
  @override
  Future<Map<String, dynamic>> getApi(
    String url, {
    bool? isAuth,
    String? token,
  }) async {
    Map<String, dynamic> responseJson;
    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
          "Authorization": isAuth ?? false ? "Bearer $token" : "",
        },
      ).timeout(
        const Duration(seconds: 20),
      );

      responseJson = returnResponse(response);
    } on SocketException {
      throw InternetException(
        'Please ensure your device is connected to the internet and try again',
      );
    } on TimeoutException {
      throw RequestTimedOutException('Server took too long to respond');
    }

    return responseJson;
  }

  @override
  Future<Map<String, dynamic>> postApi(
    Map<String, dynamic> data,
    String url, {
    bool? isAuth,
    String? token,
  }) async {
    Map<String, dynamic> responseJson;
    try {
      final response = await http.post(
        Uri.parse(url),
        body: jsonEncode(data),
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
          "Authorization": isAuth ?? false ? "Bearer $token" : "",
        },
      ).timeout(
        const Duration(seconds: 30),
      );
      responseJson = returnResponse(response);
    } on SocketException {
      throw InternetException(
          'Please ensure your device is connected to the internet and try again');
    } on TimeoutException {
      throw RequestTimedOutException('Server took too long to respond');
    }

    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    final res = jsonDecode(response.body);
    if (res['success'] == 1) return res;
    switch (response.statusCode) {
      case 200:
        return res;
      case 400:
        throw BadRequestException(res['message']);
      case 401:
        throw UnauthorizedException(res['message']);
      case 404:
        throw BadRequestException(res['message']);
      case 500:
        throw ServerException(res['message']);
      default:
        throw GeneralException('${response.statusCode}');
    }
  }
}
