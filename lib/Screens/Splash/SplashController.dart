import 'dart:async';

import 'package:get/get.dart';

class SplashController extends GetxController{

  var name = "";

  @override
  Future<void> onInit() async {
    Timer(const Duration(seconds: 4), () {
      Get.offAndToNamed("/dashboardPage");
    });
    super.onInit();
  }

}