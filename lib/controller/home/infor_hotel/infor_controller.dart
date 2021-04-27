import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khoaluantotnghiep2021/controller/home/food_service/food_service_provider.dart';
import 'package:khoaluantotnghiep2021/data/model/category.dart';
import 'package:khoaluantotnghiep2021/data/model/food.dart';
import 'package:khoaluantotnghiep2021/data/model/infor.dart';
import 'package:khoaluantotnghiep2021/ui/theme/app_colors.dart';

import 'infor_provider.dart';

class InforController extends GetxController{
  var isLoading = true.obs;
  var inforList = <InforDatum>[].obs;
  var isShown = true.obs;

  void getInforList() async {
    try {
      isLoading(true);
      var infor =  await InforProvider().fetchListInfor();
      if(inforList != null){
        inforList.assignAll(infor);
        print(inforList);
        isShown(true);
      }
    } finally {
      isLoading(false);
      isShown(false);
    }
  }

  @override
  void onInit() {
    getInforList();
    super.onInit();
  }

  @override
  void onClose() {
    Get.delete();
    super.onClose();
  }

}
