import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:tr_shop/Model/ProductListBaseResponse.dart';
import 'package:tr_shop/Model/ProductListResponse.dart';
import '../Model/Data.dart';
import 'api_client.dart';
import 'api_urls.dart';

class ApiRepository {

  /// Get Note List
  void getProductList(BuildContext context,String url, Map<String, dynamic>? params, {void Function(ProductListResponse)? onSuccess,
    void Function(String)? onFailure}) async {
    try {
      final dio = Dio();
      Response response = await dio.get(
          ApiUrls.baseUrl + ApiUrls.getProducts, queryParameters: params);
      var productList = (response.data as List).map((x) => Data.fromJson(x)).toList();
      if (response != null) {
        ProductListResponse productListResponse = ProductListResponse(status: true,message: "Fetched Successfully",data: productList);
        onSuccess!(productListResponse);
      } else {
        debugPrint(response.statusMessage);
      }
      //print("ProductList ${productList.length}");
    } catch (error, stacktrace) {
      throw Exception("Exception : $error stackTrace: $stacktrace");
    }
  }
}
