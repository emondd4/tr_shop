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
    CartModel cartModel = CartModel(name: name,des: desc,price: price);
    box.add(cartModel);
  }

}