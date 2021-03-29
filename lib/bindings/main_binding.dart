import 'package:get/get.dart';
import 'package:khoaluantotnghiep2021/controller/home/home_controller.dart';
import 'package:khoaluantotnghiep2021/controller/home/tab_controller.dart';

class MainBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() {
      return HomeController();
    });
    Get.lazyPut<FoodTabController>(() {
      return FoodTabController();
    });
  }
}