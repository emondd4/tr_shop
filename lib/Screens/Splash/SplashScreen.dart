import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:tr_shop/Utils/AppColors.dart';

import '../../Utils/AppImages.dart';
import 'SplashController.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  final SplashController controller = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppColors.instance.appPrimacyColor,
      body: Center(
        child: Lottie.asset(AppImages.instance.splashAnim),
      ),
    );
  }
}
