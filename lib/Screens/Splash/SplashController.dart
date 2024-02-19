import 'dart:async';

import 'package:get/get.dart';

class SplashController extends GetxController{

  var name = "";

  @override
  Future<void> onInit() async {
    Timer(const Duration(seconds: 7), () {
      Get.offAndToNamed("/dashboardPage");
    });
    super.onInit();
  }

}