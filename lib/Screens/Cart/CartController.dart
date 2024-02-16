import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:tr_shop/Model/CartModel.dart';

class CartController extends GetxController{

  RxList<CartModel> cartList = <CartModel>[].obs;
  final box = Hive.box<CartModel>("cart");

  @override
  void onInit() async{
    //var box = await Hive.openBox('cart');
    List<CartModel> dataList = box.values.toList();
    //print("DataList Length 2:  ${dataList.length}");
    //dataList.add(newData);
    cartList.value = dataList;
    super.onInit();
  }

  void increaseItem(int index){

  }

  void decreaseItem(int index){

  }

}