import 'package:get/get.dart';

class CartModel extends GetxController {
  int id, cartId, price, foodId, number, status, currency;
  String imgPath, name, decs, note;
  var counter = 0.obs;

  CartModel({
      this.id,
      this.cartId,
      this.price,
      this.foodId,
      this.number,
      this.status,
      this.currency,
      this.imgPath,
      this.name,
      this.decs,});
}
