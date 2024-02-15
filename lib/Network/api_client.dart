import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'dart:io' as IO;

import '../Utils/AppUiUtils.dart';
import '../Utils/appLoggerUtil.dart';



class ApiClient {


  /// GET CALL
  static Future<dynamic> get(String url, dynamic parameters, bool isTokenRequired,bool isImageRequired) async {
    try {
      Dio dio = await _dioClient(isTokenRequired,isImageRequired);
      Response response = await dio.get(url, queryParameters: parameters);
      return _response(response);
    } on DioError catch (dioError) {
      UIUtil.instance.onFailed(handleError(dioError));
    } catch (e) {
      LoggerUtil.instance.printLog(msg:  'Something went wrong : $e');
    }
  }

  /// POST CALL
  static Future<dynamic> post(
      String url, dynamic params, dynamic body, bool isTokenRequired,bool isImageRequired) async {
    try {
      Dio dio = await _dioClient(isTokenRequired,isImageRequired);
      Response response = await dio.post(url, queryParameters: params, data: body);
      return _response(response);
    } on DioError catch (dioError) {
      UIUtil.instance.onFailed(handleError(dioError));
    } catch (e) {
      LoggerUtil.instance.printLog(msg:  'Something went wrong : $e');
    }

  }

  /// PUT CALL
  static Future<dynamic> put(
      String url, dynamic params, dynamic body, bool isTokenRequired,bool isImageRequired) async {
    try {
      Dio dio = await _dioClient(isTokenRequired,isImageRequired);
      Response response =
      await dio.put(url, queryParameters: params, data: body);
      return _response(response);
    } catch (e) {
      rethrow;
    }
  }

  /// PATCH CALL
  static Future<dynamic> patch(
      String url, dynamic params, dynamic body, bool isTokenRequired,bool isImageRequired) async {
    try {
      Dio dio = await _dioClient(isTokenRequired,isImageRequired);
      Response response =
      await dio.patch(url, queryParameters: params, data: body);
      return _response(response);
    } catch (e) {
      rethrow;
    }
  }

  /// DELETE CALL
  static Future<dynamic> delete(
      String url, dynamic params, dynamic body, bool isTokenRequired,bool isImageRequired) async {
    try {
      Dio dio = await _dioClient(isTokenRequired,isImageRequired);
      Response response =
      await dio.delete(url, queryParameters: params, data: body);
      return _response(response);
    } catch (e) {
      rethrow;
    }
  }

  /// POST CALL with Files
  static Future<dynamic> upload(
      BuildContext context,
      String url, dynamic params, dynamic body, bool isTokenRequired,bool isImageUpload) async {
    try {
      Dio dio = await _dioClient(isTokenRequired,isImageUpload);
      print("imagebody:::${params.toString()}");
      Response response = await dio.post(
        url,
        queryParameters: params,
        data: FormData.fromMap(body),
      );
      return _response(response);
    } on DioError catch (dioError) {
      UIUtil.instance.onFailed(handleError(dioError));
      return _response(dioError.response!);
    } catch (e) {
      LoggerUtil.instance.printLog(msg:  'Something went wrong : $e');
    }
  }

  /// Dio Error Checking
  static handleError(DioError error) {
    switch (error.type) {
      case DioException.connectionTimeout:
        UIUtil.instance.onFailed("Connection Timeout : ${error.response.toString()}");
      case DioException.sendTimeout:
        UIUtil.instance.onFailed("Connection Sent Timeout : ${error.response.toString()}");
      case DioException.receiveTimeout:
        UIUtil.instance.onFailed("Connection Receive Timeout : ${error.response.toString()}");
      case DioException.badResponse:
        if (error.response == null) {
          UIUtil.instance.onFailed(error.response.toString());
        }
        switch (error.response?.statusCode) {
          case 401:
            UIUtil.instance.onFailed("401 : Unauthorized");
          case 400:
            UIUtil.instance.onFailed("400 : Bad Request");
          case 404:
            UIUtil.instance.onFailed("404 : Not Found");
          case 500:
            UIUtil.instance.onFailed("500 : Internal Server Error");
        }
        break;
      case DioErrorType.cancel:
        break;
      default:
        UIUtil.instance.onFailed(error.response.toString());
    }
  }

  /// CLIENT
  static Future<Dio> _dioClient(bool isTokenRequired,bool isImageUpload) async {
    String token = "";
    if (isTokenRequired) {
      // token = (await AppPreference.getValue(AppPreferenceKeys.PREF_KEY_REMEMBER_TOKEN))!;
    }
    Dio dio = Dio(await _options(token, isTokenRequired,isImageUpload));
    // dio.interceptors.add(DioFirebasePerformanceInterceptor());

    dio.interceptors.add(PrettyDioLogger(
        request: true,
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: true,
        error: true,
        compact: true,
        maxWidth: 90));

    if(!kIsWeb){
      (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
          (IO.HttpClient client) {
        client.badCertificateCallback =
            (X509Certificate cert, String host, int port) => true;
        return client;
      };
    }
    return dio;
  }

  static Future<BaseOptions> _options(
      String token, bool isTokenRequired, bool isImageUpload) async {

    var header = {
      'Accept': '*/*',
    };

    if (isTokenRequired) {
      header['Authorization'] = 'Bearer $token';
    }
    if(isImageUpload){
      header['Content-Type'] = 'multipart/form-data';
      header['Type'] = 'image/jpeg';
    }

    return BaseOptions(
      connectTimeout: const Duration(seconds: 50000),
      receiveTimeout: const Duration(seconds: 50000),
      headers: header,
    );
  }

  /// Response Parser
  static dynamic _response(Response response) {
    var responseJson = json.decode(response.toString());
    return responseJson;
  }
  /// Response Parser for Javascript Object
  static dynamic _responseJS(Response response) {
    print(const JsonEncoder.withIndent(" ").convert(const JsonDecoder().convert(response.toString())));
    return const JsonEncoder.withIndent(" ").convert(const JsonDecoder().convert(response.toString()));
  }

}