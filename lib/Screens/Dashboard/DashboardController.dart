import 'package:get/get.dart';
import 'package:tr_shop/Model/ProductListBaseResponse.dart';
import 'package:tr_shop/Model/ProductListResponse.dart';

import '../../Network/api_repository.dart';
import '../../Network/api_urls.dart';
import '../../Utils/AppCommonUtil.dart';
import '../../Utils/AppUiUtils.dart';

class DashboardController extends GetxController{
  final productList = Rxn<ProductListBaseResponse>();

  final ApiRepository _apiRepository = ApiRepository();

  @override
  void onInit() async{
    getNoteList();
    super.onInit();
  }

  ///Api Calls
  Future getNoteList() async {

    CommonUtil.instance.internetCheck().then((value) async {
      if (value) {
        _apiRepository.getProductList(Get.context!, ApiUrls.baseUrl + ApiUrls.getProducts, null,
            onSuccess: (ProductListResponse response) async {
              if (response != null) {
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