import 'package:hive/hive.dart';

part 'CartModel.g.dart';


@HiveType(typeId: 2)
class CartModel {
  CartModel({
      this.name, 
      this.des, 
      this.price,this.quantity});

  CartModel.fromJson(dynamic json) {
    name = json['name'];
    des = json['des'];
    price = json['price'];
    quantity = json['quantity'];
  }
  @HiveField(0)
  String? name;
  @HiveField(1)
  String? des;
  @HiveField(2)
  num? price;
  @HiveField(3)
  int? quantity;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['des'] = des;
    map['price'] = price;
    map['quantity'] = quantity;
    return map;
  }

}