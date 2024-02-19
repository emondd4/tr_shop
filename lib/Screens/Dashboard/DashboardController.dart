import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:tr_shop/Model/ProductListResponse.dart';

import '../../Model/CartModel.dart';
import '../../Model/Data.dart';
import '../../Network/api_repository.dart';
import '../../Network/api_urls.dart';
import '../../Utils/AppCommonUtil.dart';
import '../../Utils/AppUiUtils.dart';

class DashboardController extends GetxController{
  final productListResponse = Rxn<ProductListResponse>();
  final box = Hive.box<ProductListResponse>("productList");
  final cartBox = Hive.box<CartModel>("cart");

  final ApiRepository _apiRepository = ApiRepository();


  @override
  void onInit() async{
    productListResponse.value = box.get("productList");
    getNoteList();
    super.onInit();
  }

  void gotoDetailsPage(Data data){
    Get.toNamed("/productDetails",arguments: {"data":data});
  }

  void gotoCartPage(){
    Get.toNamed("/cart");
  }

  Future<void> addProductToCart(String name, String desc, int price) async {

    bool flag = false;
    int position = 0;

    for(int i=0;i<cartBox.values.length;i++){
      if (cartBox.getAt(i)?.price == price) {
        flag = true;
        position = i;
      }
    }

    if (flag) {
      CartModel cartModel = CartModel(name: name,des: desc,price: price,quantity: cartBox.getAt(position)!.quantity! + 1);
      cartBox.putAt(position, cartModel);
    }  else{
      CartModel cartModel = CartModel(name: name,des: desc,price: price,quantity: 1);
      cartBox.add(cartModel);
    }


    showToast();
  }

  void showToast(){
    ScaffoldMessenger.of(Get.context!).showSnackBar(const SnackBar(
      content: Text("Product Added To Cart"),
    ));
  }

  ///Api Calls
  Future getNoteList() async {

    CommonUtil.instance.internetCheck().then((value) async {
      if (value) {
        _apiRepository.getProductList(Get.context!, ApiUrls.baseUrl + ApiUrls.getProducts, null,
            onSuccess: (ProductListResponse response) async {
              if (response != null) {
                box.put("productList", response);
                productListResponse.value = box.get("productList");
                //print("Hello List : ${response.data?.length}");
              } else {
                UIUtil.instance.onFailed('Failed to Fetch Product Lists');
              }
            },
            onFailure: (String error) {
              UIUtil.instance.onFailed(error);
            });
      } else {
        UIUtil.instance.onNoInternet();
      }
    });

  }

}