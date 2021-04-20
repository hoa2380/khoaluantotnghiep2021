import 'dart:io';
import 'package:dio/dio.dart';
import 'package:khoaluantotnghiep2021/data/model/laundry.dart';
import 'package:khoaluantotnghiep2021/utils/app_clients.dart';
import 'package:khoaluantotnghiep2021/utils/app_endpoint.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LaundryServiceProvider {
  Laundry laundry;
  String _token;
  String _url = AppEndpoint.LAUNDRY;

  Future<List<LaundryDatum>> fetchListLaundry() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _token = prefs.getString('user_token');
    try {
      final response = await AppClients().post(_url,
          options: Options(
            headers: {HttpHeaders.authorizationHeader: 'Bearer $_token'},
          ));
      laundry = Laundry.fromJson(response.data);
    } on DioError catch (e) {
      print(e.error);
    }
    return laundry.data.data;
  }
}
