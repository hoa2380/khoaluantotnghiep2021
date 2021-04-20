import 'dart:io';

import 'package:dio/dio.dart';
import 'package:khoaluantotnghiep2021/data/model/infor.dart';
import 'package:khoaluantotnghiep2021/utils/app_clients.dart';
import 'package:khoaluantotnghiep2021/utils/app_endpoint.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InforProvider {
  Infor infor;
  String _token;
  String _urlInforList = AppEndpoint.INFOR;

  Future<List<InforDatum>> fetchListInfor() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _token = prefs.getString('user_token');
    try {
      final response = await AppClients().post(_urlInforList,
          options: Options(
            headers: {HttpHeaders.authorizationHeader: 'Bearer $_token'},
          ),
      );
      infor = Infor.fromJson(response.data);
    } on DioError catch (e) {
      print(e.error);
    }
    return infor.data.data;
  }
}
