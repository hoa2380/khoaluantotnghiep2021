import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:khoaluantotnghiep2021/data/model/cart.dart';
import 'package:khoaluantotnghiep2021/data/model/cart_result.dart';
import 'package:khoaluantotnghiep2021/data/model/laundry.dart';
import 'package:khoaluantotnghiep2021/data/model/photo.dart';
import 'package:khoaluantotnghiep2021/utils/app_clients.dart';
import 'package:khoaluantotnghiep2021/utils/app_endpoint.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LaundryServiceProvider {
  Laundry laundry;
  Photo photo;
  Cart laundryCart;
  CartResult cartResult;
  String _token;
  int _roomId;
  String _urlListLaundry = AppEndpoint.LIST_LAUNDRY;
  String _urlCreateLaundryCart = AppEndpoint.CREATE_LAUNDRY_CART;
  String _urlUpload = AppEndpoint.UPLOAD_IMAGE;
  String _urlAddLaundryToCart = AppEndpoint.ADD_LAUNDRY_TO_CART;

  Future<List<LaundryDatum>> fetchListLaundry() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _token = prefs.getString('user_token');
    var query = {
      'where': {
        'isActive': 1,
      }
    };
    try {
      final response = await AppClients().post(_urlListLaundry,
          data: query,
          options: Options(
            headers: {
              HttpHeaders.authorizationHeader: 'Bearer $_token',
              HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8',
            },
          ));
      laundry = Laundry.fromJson(response.data);
    } on DioError catch (e) {
      print(e.error);
    }
    return laundry.data.data;
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

  Future<Cart> createLaundryCart(signatureImagePath, note, totalMoney) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _roomId = prefs.getInt('room_id');
    _token = prefs.getString('user_token');
    var data = {
      'roomId': _roomId,
      'type': '2',
      'signatureImagePath': signatureImagePath,
      'note': note,
      'totalMoney': totalMoney,
    };
    try {
      final response = await AppClients().post(_urlCreateLaundryCart,
          data: data,
          options: Options(
            headers: {
              HttpHeaders.authorizationHeader: 'Bearer $_token',
              HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8'
            },
          ));
      if(response.statusCode == 200) {
        laundryCart = Cart.fromJson(response.data);
        print(laundryCart.data);
      }
    } on DioError catch (e) {
      print(e.error);
    }
    return laundryCart;
  }

  Future<CartResult> addLaundryToCart(cartId, List<LaundryDatum> laundryItem) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _token = prefs.getString('user_token');
    _roomId = prefs.getInt('room_id');
    var data = {
      'roomId': _roomId,
      'cartId': cartId,
      'laundryList': laundryItem.map((item) => {
        'laundryId': item.id,
        'laundryPricing': item.pricing,
        'number': item.qty.value,
        'status': 1,
        'currency': item.currency,
      }).toList(),
    };
    print(data);
    try {
      final response = await AppClients().post(_urlAddLaundryToCart,
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
