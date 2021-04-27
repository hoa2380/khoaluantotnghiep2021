import 'package:get/get.dart';

class CartModel extends GetxController {
  int id, roomId, promo, discount, totalMoney, currency, type, status;
  String dateCreated;

  CartModel(
      {this.id,
        this.roomId,
        this.promo,
        this.discount,
        this.totalMoney,
        this.currency,
        this.type,
        this.status,
        this.dateCreated});
}