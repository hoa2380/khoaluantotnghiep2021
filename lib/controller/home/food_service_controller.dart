import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khoaluantotnghiep2021/data/model/product_model.dart';

class FoodServiceController extends GetxController with SingleGetTickerProviderMixin {

  TabController tabController;

  var ordersNumber = 0.obs;
  int totalNumber = 0;

  increaseAmountOfFood(int i) {
    foodModels[i].counter++;
  }
  decreaseAmountOfFood(int i) {
    if(foodModels[i].counter > 0){
      foodModels[i].counter--;
    }
  }
  calculateTotalPrice(int amount, int price) {
    totalNumber = amount * price;
  }
  increaseOrderNumber() => ordersNumber++;
  decreaseOrderNumber() {
    if(ordersNumber > 0){
      ordersNumber--;
    }
  }

  addToCart(int i) {
    cartModels.add(foodModels[i]);
  }

  List<FoodModel> cartModels = <FoodModel>[];

  final List<Tab> serviceTabs  = <Tab> [
    Tab(text: "MUST TRY",),
    Tab(text: "PROMO",),
    Tab(text: "COFFEE JUICE",),
    Tab(text: "DRINK",),
    Tab(text: "FOOD",),
  ];

  final List<FoodModel> foodModels = <FoodModel> [
    FoodModel(
      id: 1,
      name: "Cơm gà",
      decs: "Cơm Gà Nam Chợ Mới & Bún Bò Huế",
      imgPath: "https://images.foody.vn/res/g28/277130/prof/s750x400/foody-upload-api-foody-mobile-5-201006112619.jpg",
      price: 35000,
    ),
    FoodModel(
      id: 2,
      name: "Cơm gà xối mỡ",
      decs: "Cơm Gà Nam Chợ Mới & Bún Bò Huế",
      imgPath: "https://images.foody.vn/res/g28/277130/s120x120/7d9801db-7a39-4ecd-aa22-ee0a2c56-b1a83b78-201216184600.jpeg",
      price: 30000,
    ),
    FoodModel(
      id: 3,
      name: "Bún đậu mắm tôm",
      decs: "Bún Đậu Mắm Tôm Phất Lộc - Trần Phước Thành",
      imgPath: "https://images.foody.vn/res/g90/892174/s120x120/f60dd0aa-7807-461a-b270-328dfd8b5a4f.jpg",
      price: 45000,
    ),
    FoodModel(
      id: 4,
      name: "Cold Brew",
      decs: "Cold Brew StackBuck",
      imgPath: "https://images.foody.vn/res/g72/717137/s750x750/a68ab844-3f19-4c2e-a9e9-74aa374f5dfc.jpg",
      price: 65000,
    ),
    FoodModel(
      id: 5,
      name: "Bánh tráng kẹp bò khô",
      decs: "Bánh tráng kẹp bò khô.....",
      imgPath: "https://images.foody.vn/res/g5/49432/s750x750/20174592741-foody-banh-trang-kep-di-hoa-718-636246622048135137.jpg",
      price: 15000,
    ),
    FoodModel(
      id: 6,
      name: "Vanilla Sweet Cream Cold Brew",
      decs: "Vanilla Sweet Cream Cold Brew StarBuck",
      imgPath: "https://images.foody.vn/res/g72/717137/s750x750/60b9d3ac-f467-41ec-b4b7-af35817e7c2c.jpg",
      price: 75000,
    ),
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