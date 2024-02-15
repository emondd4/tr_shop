import 'package:hive/hive.dart';

import 'Data.dart';
part 'ProductListResponse.g.dart';


@HiveType(typeId: 0)
class ProductListResponse {
  ProductListResponse({
      this.status, 
      this.message, 
      this.data,});

  ProductListResponse.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(Data.fromJson(v));
      });
    }
  }

  @HiveField(0)
  bool? status;
  @HiveField(1)
  String? message;
  @HiveField(2)
  List<Data>? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}