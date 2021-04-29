import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:ui' as ui;

import 'package:khoaluantotnghiep2021/controller/home/food_service/food_service_provider.dart';
import 'package:khoaluantotnghiep2021/data/model/cart.dart';
import 'package:khoaluantotnghiep2021/data/model/cart_result.dart';
import 'package:khoaluantotnghiep2021/data/model/category.dart';
import 'package:khoaluantotnghiep2021/data/model/food.dart';
import 'package:khoaluantotnghiep2021/data/model/photo.dart';
import 'package:khoaluantotnghiep2021/data/model/promo.dart';
import 'package:khoaluantotnghiep2021/ui/theme/app_colors.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';

class FoodServiceController extends GetxController with SingleGetTickerProviderMixin {
  TabController tabController;
  TextEditingController textNote;
  var note = '';

  var isCategoryLoading = true.obs;
  var isLoading = true.obs;
  var isVisible = true.obs;
  var isClearVisible = true.obs;

  var foodList = <FoodDatum>[].obs;
  var foodCartItem = <FoodDatum>[].obs;
  var cateList = <CategoryDatum>[].obs;
  var allPromo = Promo().obs;

  var photo = Photo().obs;
  var cart = Cart().obs;
  var cartResult = CartResult().obs;

  var totalCount = 0.obs;
  var totalCartValue = 0.obs;
  var currentColor = Colors.black87.obs;

  final GlobalKey<SfSignaturePadState> signatureGlobalKey = GlobalKey();

  void getCategories() async {
    try {
      isCategoryLoading(true);
      var categories = await FoodServiceProvider().fetchCategory();
      if (cateList != null) {
        cateList.assignAll(categories);
        cateList.insert(0, CategoryDatum(id: 0, name: 'Must Try'),);
        cateList.insert(1, CategoryDatum(id: 1, name: 'Promo'),);
        tabController = TabController(length: cateList.length, vsync: this);
        tabController.addListener(() {if(tabController.indexIsChanging)getAllPromo();});
        update();
        getFoodList();
      }
    } finally {
      isCategoryLoading(false);
    }
  }

  void getFoodList() async {
    var foods = await FoodServiceProvider().fetchListFood();
    if (foodList != null) {
      foodList.assignAll(foods);
      foodList.removeWhere((element) => element.priority == 0);
      if(allPromo.value.data.listPromo.data.isNotEmpty){
        for(int x = 0; x < foodList.length; x++){
          for(int i = 0; i < allPromo.value.data.listPromoFood.data.length; i++) {
            if(allPromo.value.data.listPromoFood.data[i].foodId == foodList[x].id){
              for(int j = 0; j < allPromo.value.data.listPromo.data.length; j++) {
                foodList[x].discount.value = foodList[x].pricing - allPromo.value.data.listPromo.data[j].discount;
              }
            }
          }
        }
      }
    }
  }

  void getFoodListByCat(int id) async {
    var foods = await FoodServiceProvider().fetchListFoodByCat(id);
    if (foodList != null) {
      foodList.assignAll(foods);
      if(allPromo.value.data.listPromo.data.isNotEmpty){
        for(int x = 0; x < foodList.length; x++){
          for(int i = 0; i < allPromo.value.data.listPromoFood.data.length; i++) {
            if(allPromo.value.data.listPromoFood.data[i].foodId == foodList[x].id){
              for(int j = 0; j < allPromo.value.data.listPromo.data.length; j++) {
                foodList[x].discount.value = foodList[x].pricing - allPromo.value.data.listPromo.data[j].discount;
              }
            }
          }
        }
      }
    }
  }

  void getAllPromo() async {
    var promotion = await FoodServiceProvider().fetchAllPromo();
    if(allPromo != null){
      allPromo.value = promotion;
    }
  }

  void getPromoList() async {
    var foods = await FoodServiceProvider().fetchListFood();
    foodList.assignAll(foods);
    if(allPromo.value.data.listPromo.data.isNotEmpty){
      for(int x = 0; x < foodList.length; x++){
        for(int i = 0; i < allPromo.value.data.listPromoFood.data.length; i++) {
          if(allPromo.value.data.listPromoFood.data[i].foodId == foodList[x].id){
            for(int j = 0; j < allPromo.value.data.listPromo.data.length; j++) {
              foodList[x].discount.value = foodList[x].pricing - allPromo.value.data.listPromo.data[j].discount;
            }
          }
        }
      }
    }
    foodList.removeWhere((element) => element.discount.value == 0);
  }

  //action cart
  void increaseCount(int i) {
    totalCount++;
    foodList[i].qty++;
    if(totalCount > 0) isVisible(false);
  }

  void decreaseCount(int i) {
    if(foodList[i].qty > 0){
      foodList[i].qty--;
      totalCount--;
      if(foodList[i].qty.value == 0) removeItem(foodList[i].id);
    }
    if(totalCount <= 0) isVisible(true);
  }

  void addItem(food) {
    var index = foodCartItem.indexWhere((element) => element.id == food.id);
    if(index != -1){
    } else {
      foodCartItem.add(food);
    }
    final ids = foodCartItem.map((e) => e.id).toSet();
    foodCartItem.retainWhere((x) => ids.remove(x.id));
  }

  void removeItem(int id) {
    int index = foodCartItem.indexWhere((element) => element.id == id);
    foodCartItem.removeAt(index);
  }

  void calculateTotal() {
    totalCartValue = 0.obs;
    foodCartItem.forEach((e) {
      totalCartValue += e.pricing * e.qty.value;
    });
  }

  //signature
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
      var img = await FoodServiceProvider().uploadImage(bytes);
      if(photo != null){
        photo.value = img;
        createFoodCart(img.data.filePath);
      }
    } finally {
      isLoading(false);
    }
  }

  void createFoodCart(signatureImagePath) async {
    try {
      isLoading(true);
      var cartResult = await FoodServiceProvider().createFoodCart(
          signatureImagePath, note, totalCartValue.value);
      if(cart != null){
        cart.value = cartResult;
        addFoodToCart(cart.value.data.cartId, foodCartItem);
      }
    } finally {
      isLoading(false);
    }
  }

  void addFoodToCart(cartId, listFoodItem) async {
    try {
      isLoading(true);
      var cartStatus = await FoodServiceProvider().addFoodToCart(cartId, listFoodItem);
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
    foodCartItem.clear();
    foodList.forEach((element) => element.qty.value = 0);
    totalCount.value = 0;
    isVisible(true);
  }

  @override
  void onInit() {
    getCategories();
    getAllPromo();
    textNote = new TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    tabController.dispose();
    textNote.dispose();
    Get.delete();
    super.onClose();
  }
}