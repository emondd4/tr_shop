import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:tr_shop/Model/CartModel.dart';

class CartController extends GetxController{

  RxList<CartModel> cartList = <CartModel>[].obs;
  final box = Hive.box<CartModel>("cart");

  @override
  void onInit() async{
    //var box = await Hive.openBox('cart');
    List<CartModel> dataList = box.values.toList();
    //print("DataList Length 2:  ${dataList.length}");
    //dataList.add(newData);
    cartList.value = dataList;
    super.onInit();
  }

  void increaseItem(int index){
    int? tempQuantity = box.getAt(index)?.quantity?.toInt();
    tempQuantity = tempQuantity! + 1;
    box.putAt(index, CartModel(name:box.getAt(index)?.name,des:box.getAt(index)?.des,price: box.getAt(index)?.price,quantity: tempQuantity));
    cartList.value = box.values.toList();
  }

  void decreaseItem(int index){
    int? tempQuantity = box.getAt(index)?.quantity?.toInt();
    if (tempQuantity! > 1) {
      tempQuantity = tempQuantity - 1;
      box.putAt(index, CartModel(name:box.getAt(index)?.name,des:box.getAt(index)?.des,price: box.getAt(index)?.price,quantity: tempQuantity));
      cartList.value = box.values.toList();
    }
  }

  void deleteItem(int index){
    box.deleteAt(index);
    cartList.value = box.values.toList();
    showToast();
  }

  void showToast(){
    ScaffoldMessenger.of(Get.context!).showSnackBar(const SnackBar(
      content: Text("Product Removed From Cart"),
    ));
  }

}