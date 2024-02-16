import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:tr_shop/Model/ProductListResponse.dart';

import '../../Model/Data.dart';
import '../../Network/api_repository.dart';
import '../../Network/api_urls.dart';
import '../../Utils/AppCommonUtil.dart';
import '../../Utils/AppUiUtils.dart';

class DashboardController extends GetxController{
  final productListResponse = Rxn<ProductListResponse>();
  final box = Hive.box<ProductListResponse>("productList");

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