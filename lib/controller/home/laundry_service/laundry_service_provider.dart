import 'dart:io';

import 'package:dio/dio.dart';
import 'package:khoaluantotnghiep2021/data/model/laundry.dart';
import 'package:khoaluantotnghiep2021/utils/app_clients.dart';
import 'package:khoaluantotnghiep2021/utils/app_endpoint.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LaundryServiceProvider {
  Laundry laundry;
  String _token;
  String _urlListLaundry = AppEndpoint.LAUNDRY;
  String _urlCreateLaundryCart = AppEndpoint.CREATE_LAUNDRY_CART;

  Future<List<LaundryDatum>> fetchListLaundry() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _token = prefs.getString('user_token');

    Map<String, dynamic> dt = {'isActive': '0'};

    try {
      final response = await AppClients().post(_urlListLaundry,
          queryParameters: dt,
          options: Options(
            headers: {HttpHeaders.authorizationHeader: 'Bearer $_token'},
          ));
      laundry = Laundry.fromJson(response.data);
    } on DioError catch (e) {
      print(e.error);
    }
    return laundry.data.data;
  }

  createLaundryCartRequest(roomId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _token = prefs.getString('user_token');
    Map<String, dynamic> data = {'roomId': '$roomId', 'type': '2'};
    try {
      final response = await AppClients().post(_urlCreateLaundryCart,
          data: data,
          options: Options(
            headers: {HttpHeaders.authorizationHeader: 'Bearer $_token'},
          ));
      print(response.data);
    } on DioError catch (e) {
      print(e.error);
    }
  }
}
