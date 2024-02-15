import 'package:get/get.dart';

import '../../Model/Data.dart';

class ProductDetailsController extends GetxController {

  final arguments = Get.arguments;
  late Data productObject;

  @override
  void onInit() {
    productObject = arguments['data'];
    super.onInit();
  }

}