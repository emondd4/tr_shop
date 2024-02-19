import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:tr_shop/Model/CartModel.dart';

import '../../Model/Data.dart';

class ProductDetailsController extends GetxController {

  final arguments = Get.arguments;
  late Data productObject;
  final box = Hive.box<CartModel>("cart");


  @override
  void onInit() {
    productObject = arguments['data'];
    super.onInit();
  }

  void gotoCartPage(){
    Get.toNamed("/cart");
  }

  Future<void> addProductToCart(String name, String desc, int price) async {
    bool flag = false;
    int position = 0;

    for(int i=0;i<box.values.length;i++){
      if (box.getAt(i)?.price == price) {
        flag = true;
        position = i;
      }
    }

    if (flag) {
      CartModel cartModel = CartModel(name: name,des: desc,price: price,quantity: box.getAt(position)!.quantity! + 1);
      box.putAt(position, cartModel);
    }  else{
      CartModel cartModel = CartModel(name: name,des: desc,price: price,quantity: 1);
      box.add(cartModel);
    }
    showToast();
  }

  void showToast(){
    ScaffoldMessenger.of(Get.context!).showSnackBar(const SnackBar(
      content: Text("Product Added To Cart"),
    ));
  }

}