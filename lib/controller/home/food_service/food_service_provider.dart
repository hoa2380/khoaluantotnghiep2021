import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:khoaluantotnghiep2021/data/model/cart.dart';
import 'package:khoaluantotnghiep2021/data/model/cart_result.dart';
import 'package:khoaluantotnghiep2021/data/model/category.dart';
import 'package:khoaluantotnghiep2021/data/model/food.dart';
import 'package:khoaluantotnghiep2021/data/model/photo.dart';
import 'package:khoaluantotnghiep2021/data/model/promo.dart';
import 'package:khoaluantotnghiep2021/utils/app_clients.dart';
import 'package:khoaluantotnghiep2021/utils/app_endpoint.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FoodServiceProvider {
  Category category;
  Food food;
  Promo promo;
  Photo photo;
  Cart foodCart;
  CartResult cartResult;
  String _token;
  int _roomId;
  String _urlListFood = AppEndpoint.LIST_FOOD;
  String _urlListCategory = AppEndpoint.CATEGORY;
  String _urlAllPromo = AppEndpoint.ALL_PROMOTION;
  String _urlUpload = AppEndpoint.UPLOAD_IMAGE;
  String _urlCreateFoodCart = AppEndpoint.CREATE_FOOD_CART;
  String _urlAddFoodToCart = AppEndpoint.ADD_FOOD_TO_CART;

  Future<List<CategoryDatum>> fetchCategory() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _token = prefs.getString('user_token');
    try {
      final response = await AppClients().post(_urlListCategory,
          options: Options(
            headers: {
              HttpHeaders.authorizationHeader: 'Bearer $_token',
              HttpHeaders.connectionHeader: 'Keep-Alive'
            },
          ));
      category = Category.fromJson(response.data);
    } on DioError catch (e) {
      print(e.error);
    }
    return category.data.data;
  }

  Future<List<FoodDatum>> fetchListFood() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _token = prefs.getString('user_token');
    var query = jsonEncode({
      'where': {
        'isActive': 1,
      }
    });
    try {
      final response = await AppClients().post(_urlListFood,
          data: query,
          options: Options(
            headers: {
              HttpHeaders.authorizationHeader: 'Bearer $_token',
              HttpHeaders.connectionHeader: 'Keep-Alive'
            },
          ));
      food = Food.fromJson(response.data);
    } on DioError catch (e) {
      print(e.error);
    }
    return food.data.data;
  }

  Future<List<FoodDatum>> fetchListFoodByCat(int id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _token = prefs.getString('user_token');
    var query = {
      'where': {'isActive': 1, 'categoryId': id}
    };
    try {
      final response = await AppClients().post(_urlListFood,
          data: query,
          options: Options(
            headers: {
              HttpHeaders.authorizationHeader: 'Bearer $_token',
              HttpHeaders.connectionHeader: 'Keep-Alive'
            },
          ));
      food = Food.fromJson(response.data);
    } on DioError catch (e) {
      print(e.error);
    }
    return food.data.data;
  }

  Future<Promo> fetchAllPromo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _token = prefs.getString('user_token');
    var query = {"isNow": 1};
    try {
      final response = await AppClients().post(_urlAllPromo,
          data: query,
          options: Options(
            headers: {
              HttpHeaders.authorizationHeader: 'Bearer $_token',
              HttpHeaders.connectionHeader: 'Keep-Alive',
            },
          ));
      promo = Promo.fromJson(response.data);
    } on DioError catch (e) {
      print(e.error);
    }
    return promo;
  }

  Future<Photo> uploadImage(ByteData bytes) async {
    var buffer = bytes.buffer;
    var base64Img = base64.encode(Uint8List.view(buffer));
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _token = prefs.getString('user_token');
    try {
      final response = await AppClients().post(_urlUpload,
          data: {
            'base64': base64Img,
          },
          options: Options(
            headers: {
              HttpHeaders.authorizationHeader: 'Bearer $_token',
              HttpHeaders.contentTypeHeader: 'application/x-www-form-urlencoded; charset=UTF-8',
            },
          ));
      photo = Photo.fromJson(response.data);
    } on DioError catch (e) {
      print(e.error);
    }
    return photo;
  }

  Future<Cart> createFoodCart(signatureImagePath, note, totalMoney) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _roomId = prefs.getInt('room_id');
    _token = prefs.getString('user_token');
    var data = {
      'roomId': _roomId,
      'type': '1',
      'signatureImagePath': signatureImagePath,
      'note': note,
      'totalMoney': totalMoney,
    };
    try {
      final response = await AppClients().post(_urlCreateFoodCart,
          data: data,
          options: Options(
            headers: {
              HttpHeaders.authorizationHeader: 'Bearer $_token',
              HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8'
            },
          ));
      if(response.statusCode == 200) {
        foodCart = Cart.fromJson(response.data);
        print(foodCart.data);
      }
    } on DioError catch (e) {
      print(e.error);
    }
    return foodCart;
  }

  Future<CartResult> addFoodToCart(cartId, List<FoodDatum> foodItem) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _token = prefs.getString('user_token');
    _roomId = prefs.getInt('room_id');
    var data = {
      'roomId': _roomId,
      'cartId': cartId,
      'laundryList': foodItem.map((item) => {
        'laundryId': item.id,
        'laundryPricing': item.pricing,
        'number': item.qty.value,
        'status': 1,
        'currency': item.currency,
      }).toList(),
    };
    print(data);
    try {
      final response = await AppClients().post(_urlAddFoodToCart,
          data: data,
          options: Options(
            headers: {
              HttpHeaders.authorizationHeader: 'Bearer $_token',
              HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8',
            },
          ));
      cartResult = CartResult.fromJson(response.data);
    } on DioError catch (e) {
      print(e.error);
    }
    return cartResult;
  }

}