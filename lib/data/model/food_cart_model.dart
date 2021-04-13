import 'package:get/get.dart';

class FoodCart extends GetxController {
  int id, cartId, foodId, quantity, status, currency;
  double price, discount;
  String name, decs, imgPath;

  FoodCart(
      {this.id,
      this.cartId,
      this.foodId,
      this.quantity,
      this.status,
      this.currency,
      this.price,
      this.discount,
      this.name,
      this.decs,
      this.imgPath});

}
