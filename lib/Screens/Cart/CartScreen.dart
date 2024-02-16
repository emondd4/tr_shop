import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:tr_shop/Screens/Cart/CartController.dart';

import '../../Utils/AppColors.dart';
import '../../Utils/AppImages.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {

  final CartController controller = Get.put(CartController());

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
                  InkWell(onTap:() {
                    Get.back();
                  },child: Icon(Icons.arrow_back_ios_new,size: 24.0,color: AppColors.instance.appPrimacyColor,)),
                  const SizedBox(width: 20.0,),
                  Expanded(
                    child: Text(
                      "Shopping Cart",
                      style: GoogleFonts.nunito(
                          fontSize: 26.0,
                          fontWeight: FontWeight.w700,
                          color: AppColors.instance.appPrimacyColor),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        body: Obx(() => controller.cartList.value.isEmpty == true ? Center(child: Lottie.asset(AppImages.instance.emptyAnim),) : ListView.builder(
          itemBuilder: (context, index) => productItem(index),
          itemCount: controller.cartList.value.length,
        )),
      ),
    );
  }

  Widget productItem(int index){

    return InkWell(
      onTap: () {
        //controller.gotoDetailsPage(controller.productListResponse.value!.data![index]);
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
                          controller.cartList.value?[index].name ?? "Loading...",
                          style: GoogleFonts.nunito(
                              fontSize: 20.0,
                              fontWeight: FontWeight.w700,
                              color: AppColors.instance.appSecondaryColor),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          controller.cartList.value?[index].des ?? "Loading...",
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
              const SizedBox(
                width: 10.0,
              ),
              Column(
                children: [
                  Text("\$${controller.cartList.value?[index].price}",
                    style: GoogleFonts.nunito(
                        fontSize: 22.0,
                        fontWeight: FontWeight.w600,
                        color: AppColors.instance.appPrimacyColor),
                  ),
                  const SizedBox(height: 20,),
                  Row(
                    children: [
                      InkWell(
                        onTap: () {

                        },
                        child: Container(
                          height: 36.0,
                          width: 36.0,
                          decoration: BoxDecoration(
                            color: AppColors.instance.appPrimacyColor,
                            borderRadius: BorderRadius.circular(8.0)
                          ),
                          child: Center(
                            child: Text("-",
                              style: GoogleFonts.nunito(
                                  fontSize: 22.0,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 36.0,
                        width: 36.0,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8.0)
                        ),
                        child: Center(
                          child: Text(controller.box.getAt(index)?.price.toString() ?? "1",
                            style: GoogleFonts.nunito(
                                fontSize: 25.0,
                                fontWeight: FontWeight.w600,
                                color: AppColors.instance.appPrimacyColor),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {

                        },
                        child: Container(
                          height: 36.0,
                          width: 36.0,
                          decoration: BoxDecoration(
                            color: AppColors.instance.appPrimacyColor,
                            borderRadius: BorderRadius.circular(8.0)
                          ),
                          child: Center(
                            child: Text("+",
                              style: GoogleFonts.nunito(
                                  fontSize: 22.0,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );

  }

}
