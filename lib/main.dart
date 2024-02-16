import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:tr_shop/Model/CartModel.dart';
import 'package:tr_shop/Model/Data.dart';
import 'package:tr_shop/Model/ProductListResponse.dart';
import 'package:tr_shop/Utils/AppColors.dart';

import 'Utils/AppRoutes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(ProductListResponseAdapter());
  Hive.registerAdapter(DataAdapter());
  Hive.registerAdapter(CartModelAdapter());
  await Hive.openBox<ProductListResponse>("productList");
  await Hive.openBox<CartModel>("cart");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: AppColors.instance.appPrimacyColor
    ));

    return GetMaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      getPages: AppRoutes.instance.routeList,
      initialRoute: "/splashPage",
    );
  }
}
