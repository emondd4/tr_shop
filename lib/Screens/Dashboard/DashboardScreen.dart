import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../../Utils/AppColors.dart';
import '../../Utils/AppImages.dart';
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "TR Store",
                    style: GoogleFonts.nunito(
                        fontSize: 26.0,
                        fontWeight: FontWeight.w700,
                        color: AppColors.instance.appPrimacyColor),
                  ),
                  Container(
                    height: 48,
                    width: 48,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      color: AppColors.instance.appPrimacyColor
                    ),
                    child: const Center(
                      child: Icon(Icons.shopping_cart_outlined,color: Colors.white,),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        body: Obx(() => controller.productListResponse.value?.data?.isEmpty == true ? Center(child: Lottie.asset(AppImages.instance.emptyAnim),) : ListView.builder(
          itemBuilder: (context, index) => productItem(index),
          itemCount: controller.productListResponse.value?.data?.length ?? 0,
        )),
      ),
    );
  }

  Widget productItem(int index){

    return InkWell(
      onTap: () {
        controller.gotoDetailsPage(controller.productListResponse.value!.data![index]);
      },
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(15.0),color: Colors.white),
          child: Row(
            children: [
              Container(
                height: 123,
                width: 10,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(15.0),
                        bottomLeft: Radius.circular(15.0)),
                    gradient: LinearGradient(colors: [AppColors.instance.appPrimacyColor, AppColors.instance.appSecondaryColor])),
              ),
              const SizedBox(
                width: 10.0,
              ),
              Expanded(
                  child: SizedBox(
                    height: 123,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          controller.productListResponse.value?.data?[index].title ?? "Loading...",
                          style: GoogleFonts.nunito(
                              fontSize: 20.0,
                              fontWeight: FontWeight.w700,
                              color: AppColors.instance.appSecondaryColor),
                        ),
                        Text(
                          controller.productListResponse.value?.data?[index].content ?? "Loading...",
                          style: GoogleFonts.nunito(
                              fontSize: 15.0,
                              fontWeight: FontWeight.w700,
                              color: AppColors.instance.appSecondaryColor),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  )),
              Text("\$${controller.productListResponse.value?.data?[index].id}",
                style: GoogleFonts.nunito(
                    fontSize: 15.0,
                    fontWeight: FontWeight.w600,
                    color: AppColors.instance.appPrimacyColor),
              ),
            ],
          ),
        ),
      ),
    );

  }

}
