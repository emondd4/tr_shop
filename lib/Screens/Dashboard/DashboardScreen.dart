import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../../Utils/AppColors.dart';
import 'DashboardController.dart';

class DashboardScreen extends StatelessWidget {
  DashboardScreen({super.key});

  final DashboardController controller = Get.put(DashboardController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(71),
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 20.0),
              child: Text(
                "TR Store",
                style: GoogleFonts.nunito(
                    fontSize: 26.0,
                    fontWeight: FontWeight.w700,
                    color: AppColors.instance.appPrimacyColor),
              ),
            ),
          ),
        ),
        body: Container(),
        // body: Obx(() => controller.noteList.value?.data?.data?.isEmpty == true ? Center(child: Lottie.asset(AppImages.instance.emptyAnim),) : ListView.builder(
        //   itemBuilder: (context, index) => noteItem(index),
        //   itemCount: controller.noteList.value?.data?.data?.length ?? 0,
        // )),
      ),
    );
  }



}
