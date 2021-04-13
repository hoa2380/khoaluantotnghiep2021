import 'package:get/get.dart';

class FoodModel extends GetxController {
  int id, cartId, price, foodId, number, status, currency;
  String imgPath, name, decs;
  var counter = 0.obs;

  FoodModel({
    this.id,
    this.cartId,
    this.price,
    this.foodId,
    this.number,
    this.status,
    this.currency,
    this.imgPath,
    this.name,
    this.decs,
  });
}
