
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khoaluantotnghiep2021/controller/home/food_service/food_service_provider.dart';
import 'package:khoaluantotnghiep2021/data/model/food.dart';

class FoodServiceController extends GetxController with SingleGetTickerProviderMixin {
  TabController tabController;
  var isLoading = true.obs;
  var foodList = <FoodDatum>[].obs;

  void getFoodList() async {
    try {
      isLoading(true);
      var foods =  await FoodServiceProvider().fetchListFood();
      if(foodList != null){
        foodList.assignAll(foods);
        print(foodList);
      }
    } finally {
      isLoading(false);
    }
  }

  final List<Tab> serviceTabs = <Tab>[
    Tab(
      text: "MUST TRY",
    ),
    Tab(
      text: "PROMO",
    ),
    Tab(
      text: "COFFEE JUICE",
    ),
    Tab(
      text: "DRINK",
    ),
    Tab(
      text: "FOOD",
    ),
  ];

  @override
  void onInit() {
    getFoodList();
    tabController = TabController(length: serviceTabs.length, vsync: this);
    super.onInit();
  }

  @override
  void onClose() {
    tabController.dispose();
    Get.delete();
    super.onClose();
  }

}