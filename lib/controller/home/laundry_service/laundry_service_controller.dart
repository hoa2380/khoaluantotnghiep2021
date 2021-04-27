import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khoaluantotnghiep2021/controller/home/laundry_service/laundry_service_provider.dart';
import 'package:khoaluantotnghiep2021/data/model/cart.dart';
import 'package:khoaluantotnghiep2021/data/model/cart_result.dart';
import 'package:khoaluantotnghiep2021/data/model/laundry.dart';
import 'package:khoaluantotnghiep2021/data/model/photo.dart';
import 'package:khoaluantotnghiep2021/ui/theme/app_colors.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';

class LaundryServiceController extends GetxController with SingleGetTickerProviderMixin{
  TextEditingController textNote;
  var note = '';
  var isLoading = true.obs;
  var isVisible = true.obs;
  var isClearVisible = true.obs;
  var laundryList = <LaundryDatum>[].obs;
  var laundryCartItem = <LaundryDatum>[].obs;
  var photo = Photo().obs;
  var cart = Cart().obs;
  var cartResult = CartResult().obs;

  var totalCount = 0.obs;
  var totalCartValue = 0.obs;
  var currentColor = Colors.black87.obs;

  final GlobalKey<SfSignaturePadState> signatureGlobalKey = GlobalKey();

  void getLaundryList() async {
    try {
      isLoading(true);
      var laundry =  await LaundryServiceProvider().fetchListLaundry();
      if(laundryList != null){
        laundryList.assignAll(laundry);
        print(laundryList);
      }
    } finally {
      isLoading(false);
    }
  }

  void addItem(laundry) {
    var index = laundryCartItem.indexWhere((element) => element.id == laundry.id);
    if(index != -1){
    } else {
      laundryCartItem.add(laundry);
    }
    final ids = laundryCartItem.map((e) => e.id).toSet();
    laundryCartItem.retainWhere((x) => ids.remove(x.id));
  }

  void removeItem(int id) {
    int index = laundryCartItem.indexWhere((element) => element.id == id);
    laundryCartItem.removeAt(index);
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
    laundryCartItem.forEach((e) {
      totalCartValue += e.pricing * e.qty.value;
    });
  }

  void changeStrokeColor(Color color) => currentColor.value = color;

  void clearSign() {
    signatureGlobalKey.currentState.clear();
    isClearVisible(true);
  }

  void uploadImg() async {
    final data = await signatureGlobalKey.currentState.toImage(pixelRatio: 4.5);
    final bytes = await data.toByteData(format: ui.ImageByteFormat.png);
    try {
      isLoading(true);
      var img = await LaundryServiceProvider().uploadImage(bytes);
      if(photo != null){
        photo.value = img;
        createLaundryCart(img.data.filePath);
      }
    } finally {
      isLoading(false);
    }
  }

  void createLaundryCart(signatureImagePath) async {
    try {
      isLoading(true);
      var cartResult = await LaundryServiceProvider().createLaundryCart(
          signatureImagePath, note, totalCartValue.value);
      if(cart != null){
        cart.value = cartResult;
        addLaundryToCart(cart.value.data.cartId, laundryCartItem);
      }
    } finally {
      isLoading(false);
    }
  }

  void addLaundryToCart(cartId, listLaundryItem) async {
    try {
      isLoading(true);
      var cartStatus = await LaundryServiceProvider().addLaundryToCart(cartId, listLaundryItem);
      if(cartResult != null) {
        cartResult.value = cartStatus;
        Get.defaultDialog(
            title: "Thank you!",
            titleStyle: TextStyle(
              color: AppColors.primaryTextColor,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            content: Column(
              children: [
                Text("Your oder is sent."),
                SizedBox(height: 10),
                TextButton(
                  child: Text('Okay'),
                  style: TextButton.styleFrom(
                    textStyle: TextStyle(
                      fontSize: 12,
                    ),
                    primary: Colors.white,
                    backgroundColor: AppColors.primaryColor,
                  ),
                  onPressed: () => Get.back(),
                ),
              ],
            )
        );
        clearBooking();
        print(cartResult.value);
      }
      else Get.defaultDialog(
          title: "Error!",
          titleStyle: TextStyle(
            color: AppColors.primaryTextColor,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          content: Column(
            children: [
              Text("Cannot booking this time"),
              SizedBox(height: 10),
              TextButton(
                child: Text('Okay'),
                style: TextButton.styleFrom(
                  textStyle: TextStyle(
                    fontSize: 12,
                  ),
                  primary: Colors.white,
                  backgroundColor: AppColors.primaryColor,
                ),
                onPressed: () => Get.back(),
              ),
            ],
          )
      );
    } finally {
      isLoading(false);
    }
  }

  void clearBooking() {
    laundryCartItem.clear();
    laundryList.forEach((element) => element.qty.value = 0);
    totalCount.value = 0;
    isVisible(true);
  }

  showDialog() {
    return Get.defaultDialog(
        title: "Login Failed",
        titleStyle: TextStyle(
          color: AppColors.primaryTextColor,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        content: Column(
          children: [
            Text("Please contact via manager!"),
            SizedBox(height: 10),
            TextButton(
              child: Text('Okay'),
              style: TextButton.styleFrom(
                textStyle: TextStyle(
                  fontSize: 12,
                ),
                primary: Colors.white,
                backgroundColor: AppColors.primaryColor,
              ),
              onPressed: () => Get.back(),
            ),
          ],
        ));
  }

  @override
  void onInit() {
    getLaundryList();
    textNote = new TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    textNote.dispose();
    Get.delete();
    super.onClose();
  }
}