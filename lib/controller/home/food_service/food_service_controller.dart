import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khoaluantotnghiep2021/controller/home/food_service/food_service_provider.dart';
import 'package:khoaluantotnghiep2021/data/model/category.dart';
import 'package:khoaluantotnghiep2021/data/model/food.dart';

class FoodServiceController extends GetxController with SingleGetTickerProviderMixin {
  TabController tabController;
  var isLoading = true.obs;
  var foodList = <FoodDatum>[].obs;
  var listCategory = <CategoryDatum>[].obs;
  var listTabs = <Tab>[].obs;

  Future<void> getCategories() async {
    try {
      isLoading(true);
      var categories =  await FoodServiceProvider().fetchCategory();
      if(listCategory != null){
        listCategory.assignAll(categories);
        listCategory.forEach((element) {
          listTabs.add(Tab(text: element.name.toUpperCase(),));
        });
        listTabs.insert(0, Tab(text: 'MUST TRY',));
        listTabs.insert(1, Tab(text: 'PROMO',));
        tabController = TabController(length: listTabs.length, vsync: this);
        update();
        print(listCategory);
      }
    } finally {
      isLoading(false);
    }
  }

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

  @override
  void onInit() {
    getCategories();
    getFoodList();
    super.onInit();
  }

  @override
  void onClose() {
    tabController.dispose();
    Get.delete();
    super.onClose();
  }

}
