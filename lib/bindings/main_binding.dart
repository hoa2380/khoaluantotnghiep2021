import 'package:get/get.dart';
import 'package:khoaluantotnghiep2021/controller/home/activity_service/activity_service_controller.dart';
import 'package:khoaluantotnghiep2021/controller/home/home_controller.dart';
import 'package:khoaluantotnghiep2021/controller/home/food_service/food_service_controller.dart';
import 'package:khoaluantotnghiep2021/controller/login/login_controller.dart';

class MainBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() {
      return LoginController();
    });
    Get.lazyPut<HomeController>(() {
      return HomeController();
    });
    Get.lazyPut<FoodServiceController>(() {
      return FoodServiceController();
    });
    Get.lazyPut<ActivityServiceController>((){
      return ActivityServiceController();
    });
  }
}