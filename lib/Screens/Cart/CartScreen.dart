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
                  Text(
                    "Shopping Cart",
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
              Text("\$${controller.cartList.value?[index].price}",
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
