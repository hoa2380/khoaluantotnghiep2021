import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khoaluantotnghiep2021/controller/home/food_service/food_service_controller.dart';
import 'package:khoaluantotnghiep2021/controller/home/home_controller.dart';
import 'package:khoaluantotnghiep2021/controller/login/login_controller.dart';
import 'package:khoaluantotnghiep2021/ui/home/activity_service/activity_service.dart';
import 'package:khoaluantotnghiep2021/ui/theme/app_colors.dart';

import 'dont_disturb/dont_disturb.dart';
import 'food_service/food_service.dart';
import 'information_hotel/information_hotel.dart';
import 'laundry_service/laundry_service.dart';

class HomePage extends GetView<HomeController>{
  @override
  Widget build(BuildContext context) {
    FoodServiceController c = Get.find();
    LoginController l = Get.find();
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 14),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Obx(() => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text( 'Room: ' +
                        l.textRoomName.text,
                        style: TextStyle(
                            fontSize: 20,
                            color: AppColors.primaryTextColor),
                      ),
                      Text( 'GUEST NAME: ' +
                        l.guestName.value,
                        style: TextStyle(
                            fontSize: 18, color: AppColors.primaryTextColor),
                      ),
                    ],
                  )),
                  Text(
                    "History",
                    style: TextStyle(
                        fontSize: 18, color: AppColors.primaryTextColor),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: PageView(
                controller: controller.pageController,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  FoodServicePage(),
                  LaundryServicePage(),
                  ActivityServicePage(),
                  DontDisturb(),
                  InformationHotel(),
                ],
              ),
            ),
          ],
        ),
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
              controller.pageController.jumpToPage(tab);
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
  openBottomSheet(){
    Get.bottomSheet(
      DraggableScrollableSheet(builder: (context, scrollController){
        return Container(
          padding: EdgeInsets.all(8),
          color: Colors.white,
          child: Column(
            children: [
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Orders Details",
                      style: TextStyle(
                        fontSize: 22,
                        color: AppColors.primaryTextColor,
                        fontWeight: FontWeight.bold,
                      ),),
                    Text("Total"),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: 20,
                    controller: scrollController,
                    itemBuilder: (context, index){
                      return ListTile(
                        title: Text("$index"),
                      );
                    }),
              ),
            ],
          ),
        );
      }),
    );
  }
}
