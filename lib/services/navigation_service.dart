import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:khoaluantotnghiep2021/ui/theme/app_colors.dart';

class NavigationService {
  List<BubbleBottomBarItem> getNavigationItemList() {
    return <BubbleBottomBarItem>[
      BubbleBottomBarItem(
          backgroundColor: AppColors.iconColor,
          icon: Image.asset("assets/images/ic_food_2.png", height: 24, color: AppColors.iconColor,),
          activeIcon: Image.asset("assets/images/ic_food_2.png", height: 18, color: AppColors.iconColor,),
          title: Text("Foods", style: TextStyle(fontSize: 14, color: Colors.white,),)),
      BubbleBottomBarItem(
          backgroundColor: AppColors.iconColor,
          icon: Image.asset("assets/images/ic_laundry_2.png", height: 24, color: AppColors.iconColor,),
          activeIcon: Image.asset("assets/images/ic_laundry_2.png", height: 18, color: AppColors.iconColor,),
          title: Text("Laundry", style: TextStyle(fontSize: 14, color: Colors.white,),)),
      BubbleBottomBarItem(
          backgroundColor: AppColors.iconColor,
          icon: Image.asset("assets/images/ic_tourist.png", height: 24,),
          activeIcon: Image.asset("assets/images/ic_tourist.png", height: 18,),
          title: Text("Activity", style: TextStyle(fontSize: 14, color: Colors.white,),)),
      BubbleBottomBarItem(
          backgroundColor: AppColors.iconColor,
          icon: Image.asset("assets/images/ic_do_not_distrup.png", height: 22,),
          activeIcon: Image.asset("assets/images/ic_do_not_distrup.png", height: 14,),
          title: Text("Don't Distrup", style: TextStyle(fontSize: 12, color: Colors.white,),)),
      BubbleBottomBarItem(
          backgroundColor: AppColors.iconColor,
          icon: Image.asset("assets/images/ic_hotel.png", height: 24, color: AppColors.iconColor,),
          activeIcon: Image.asset("assets/images/ic_hotel.png", height: 14, color: AppColors.iconColor,),
          title: Text("Information", style: TextStyle(fontSize: 12, color: Colors.white,),)),
    ];
  }
}
