import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tr_shop/Screens/ProductDetails/ProductDetailsController.dart';

import '../../Utils/AppColors.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {

  final ProductDetailsController controller = Get.put(ProductDetailsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Container(
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
                        "Product Details",
                        style: GoogleFonts.nunito(
                            fontSize: 26.0,
                            fontWeight: FontWeight.w700,
                            color: AppColors.instance.appPrimacyColor),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        controller.gotoCartPage();
                      },
                      child: Container(
                        height: 48,
                        width: 48,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.0),
                            color: AppColors.instance.appPrimacyColor
                        ),
                        child: const Center(
                          child: Icon(Icons.shopping_cart_outlined,color: Colors.white,),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Image.network(controller.productObject.image.toString()),
                    const SizedBox(height: 20.0,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "\$${controller.productObject.id.toString()}",
                          style: GoogleFonts.nunito(
                              fontSize: 25.0,
                              fontWeight: FontWeight.w700,
                              color: AppColors.instance.appSecondaryColor),
                        ),
                        ElevatedButton(onPressed: () {
                          controller.addProductToCart(controller.productObject.title.toString(), controller.productObject.content.toString(), int.parse(controller.productObject.id.toString()));
                        }, child: Text(
                          "Add to Cart",
                          style: GoogleFonts.nunito(
                              fontSize: 22.0,
                              fontWeight: FontWeight.w700,
                              color: AppColors.instance.appSecondaryColor),
                        ),)
                      ],
                    ),
                    const SizedBox(height: 40.0,),
                    Text(
                      controller.productObject.title.toString(),
                      style: GoogleFonts.nunito(
                          fontSize: 22.0,
                          fontWeight: FontWeight.w700,
                          color: AppColors.instance.appSecondaryColor),
                    ),
                    const SizedBox(height: 20.0,),
                    Text(
                      controller.productObject.content.toString(),
                      style: GoogleFonts.nunito(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w500,
                          color: AppColors.instance.appSecondaryColor),
                    ),
                  ],
                ),
              ),
            ))
          ],
        ),
      )
    );

  }
}
