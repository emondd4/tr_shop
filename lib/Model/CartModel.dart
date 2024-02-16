import 'package:hive/hive.dart';

part 'CartModel.g.dart';


@HiveType(typeId: 2)
class CartModel {
  CartModel({
      this.name, 
      this.des, 
      this.price,});

  CartModel.fromJson(dynamic json) {
    name = json['name'];
    des = json['des'];
    price = json['price'];
  }
  @HiveField(0)
  String? name;
  @HiveField(1)
  String? des;
  @HiveField(2)
  num? price;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['des'] = des;
    map['price'] = price;
    return map;
  }

}