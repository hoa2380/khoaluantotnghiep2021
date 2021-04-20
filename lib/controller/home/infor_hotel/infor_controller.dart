import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khoaluantotnghiep2021/controller/home/food_service/food_service_provider.dart';
import 'package:khoaluantotnghiep2021/data/model/category.dart';
import 'package:khoaluantotnghiep2021/data/model/food.dart';
import 'package:khoaluantotnghiep2021/data/model/infor.dart';

import 'infor_provider.dart';

class InforController extends GetxController with SingleGetTickerProviderMixin {
  var isLoading = true.obs;
  var inforList = <InforDatum>[].obs;

  void getInforList() async {
    try {
      isLoading(true);
      var infor =  await InforProvider().fetchListInfor();
      if(inforList != null){
        inforList.assignAll(infor);
        print(inforList);
      }
    } finally {
      isLoading(false);
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
