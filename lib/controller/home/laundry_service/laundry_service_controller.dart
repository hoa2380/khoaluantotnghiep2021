import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khoaluantotnghiep2021/controller/home/laundry_service/laundry_service_provider.dart';
import 'package:khoaluantotnghiep2021/data/model/laundry.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';

class LaundryServiceController extends GetxController with SingleGetTickerProviderMixin{
  var isLoading = true.obs;
  var isVisible = true.obs;
  var isClearVisible = true.obs;
  var laundryList = <LaundryDatum>[].obs;
  var cart = <LaundryDatum>[].obs;
  var totalCount = 0.obs;
  var totalCartValue = 0.obs;
  var currentColor = Colors.black.obs;

  final GlobalKey<SfSignaturePadState> signatureGlobalKey = GlobalKey();


  void getLaundryList() async {
    try {
      isLoading(true);
      var laundry =  await LaundryServiceProvider().fetchListLaundry();
      if(laundryList != null){
        laundryList.assignAll(laundry.where((element) => element.isActive == 1));
        print(laundryList);
      }
    } finally {
      isLoading(false);
    }
  }

  void addItem(laundry) {
    var index = cart.indexWhere((element) => element.id == laundry.id);
    if(index != -1){
      print(index);
    } else {
      cart.add(laundry);
    }
    final ids = cart.map((e) => e.id).toSet();
    cart.retainWhere((x) => ids.remove(x.id));
  }

  void removeItem(int id) {
    int index = cart.indexWhere((element) => element.id == id);
    cart.removeAt(index);
  }

  void increaseCount(int i) {
    totalCount++;
    laundryList[i].qty++;
    if(totalCount > 0) isVisible(false);
  }

  void decreaseCount(int i) {
    if(laundryList[i].qty > 0){
      laundryList[i].qty--;
      totalCount--;
      print(laundryList[i].qty);
      if(laundryList[i].qty.value == 0) removeItem(laundryList[i].id);
    }
    if(totalCount <= 0) isVisible(true);
  }

  void calculateTotal() {
    totalCartValue = 0.obs;
    cart.forEach((e) {
      totalCartValue += e.pricing * e.qty.value;
    });
  }

  void changeStrokeColor(Color color) => currentColor.value = color;

  void clearSign() {
    signatureGlobalKey.currentState.clear();
    isClearVisible(true);
  }

  @override
  void onInit() {
    getLaundryList();
    super.onInit();
  }

  @override
  void onClose() {
    Get.delete();
    super.onClose();
  }
}