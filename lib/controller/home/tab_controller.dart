import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FoodTabController extends GetxController with SingleGetTickerProviderMixin {

  TabController tabController;

  final List<Tab> serviceTabs  = <Tab> [
    Tab(text: "MUST TRY",),
    Tab(text: "PROMO",),
    Tab(text: "COFFEE JUICE",),
    Tab(text: "DRINK",),
    Tab(text: "FOOD",),
  ];

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: serviceTabs.length, vsync: this);
  }

  @override
  void onClose() {
    tabController.dispose();
    Get.delete();
    super.onClose();
  }
}