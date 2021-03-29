import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khoaluantotnghiep2021/controller/home/tab_controller.dart';
import 'package:khoaluantotnghiep2021/ui/theme/app_colors.dart';

class FoodService extends GetView<FoodTabController> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: DefaultTabController(
            length: 5,
            child: TabBar(
              controller: controller.tabController,
              isScrollable: true,
              unselectedLabelColor: AppColors.primaryTextColor,
              labelStyle: TextStyle(
                fontSize: 18
              ),
              indicatorSize: TabBarIndicatorSize.tab,
              indicator: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [AppColors.primaryAccentColor, AppColors.primaryColor]),
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.redAccent),
              tabs: controller.serviceTabs,
            ),
          ),),
        Expanded(
          child: Container(
            child: TabBarView(
              controller: controller.tabController,
              children: [
                Center(child: Text("Must Try")),
                Center(child: Text("PROMO")),
                Center(child: Text("COFFEE JUICE")),
                Center(child: Text("DRINK")),
                Center(child: Text("FOOD")),
              ],
            ),
          ),
        )
      ],
    );
  }
}