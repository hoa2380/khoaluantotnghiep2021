import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khoaluantotnghiep2021/controller/home/home_controller.dart';
import 'package:khoaluantotnghiep2021/ui/theme/app_colors.dart';

import 'food_service/food_service.dart';

class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 14),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Room: 400", style: TextStyle(fontSize: 18, color: AppColors.primaryTextColor),),
                      Text("GUES NAME: Kem", style: TextStyle(fontSize: 18, color: AppColors.primaryTextColor),),
                    ],
                  ),
                  Text("History", style: TextStyle(fontSize: 18, color: AppColors.primaryTextColor),),
                ],
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: PageView(
                controller: controller.pageCotroller,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  FoodService(),
                  Center(
                    child: ElevatedButton(
                      child: Text("Reset"),
                      style: ElevatedButton.styleFrom(primary: Colors.deepPurple),
                      onPressed: () {
                        controller.resetCount();
                      },
                    ),
                  ),
                  Center(
                    child: ElevatedButton(
                      child: Text("Reset"),
                      style: ElevatedButton.styleFrom(primary: Colors.deepPurple),
                      onPressed: () {
                        controller.resetCount();
                      },
                    ),
                  ),
                  Center(
                    child: ElevatedButton(
                      child: Text("Reset"),
                      style: ElevatedButton.styleFrom(primary: Colors.deepPurple),
                      onPressed: () {
                        controller.resetCount();
                      },
                    ),
                  ),
                  Center(
                    child: ElevatedButton(
                      child: Text("Reset"),
                      style: ElevatedButton.styleFrom(primary: Colors.deepPurple),
                      onPressed: () {
                        controller.resetCount();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.bottomBarColor,
        child: Icon(Icons.shopping_cart, color: AppColors.iconColor,),
        onPressed: () {
          controller.increment();
        },
      ),
      bottomNavigationBar: ValueBuilder<int>(
        initialValue: 0,
        builder: (value, updateFn) => Container(
          color: AppColors.bottomBarColor,
          child: BubbleBottomBar(
            backgroundColor: AppColors.bottomBarColor,
            opacity: .2,
            currentIndex: value,
            onTap: (tab) {
              controller.pageCotroller.animateToPage(tab,
                  duration: controller.animationDuration, curve: Curves.ease);
              updateFn(tab);
            },
            elevation: 8.0,
            hasInk: true,
            inkColor: Colors.green,
            items: controller.navigationItems,
          ),
        ),
      ),
    );
  }
}


