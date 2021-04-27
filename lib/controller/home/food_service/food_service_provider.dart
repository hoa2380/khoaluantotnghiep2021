import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:khoaluantotnghiep2021/data/model/category.dart';
import 'package:khoaluantotnghiep2021/data/model/food.dart';
import 'package:khoaluantotnghiep2021/utils/app_clients.dart';
import 'package:khoaluantotnghiep2021/utils/app_endpoint.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FoodServiceProvider {
  Category category;
  Food food;
  String _token;
  String _urlListFood = AppEndpoint.LIST_FOOD;
  String _urlListCategory = AppEndpoint.CATEGORY;

  Future<List<CategoryDatum>> fetchCategory() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _token = prefs.getString('user_token');
    try {
      final response = await AppClients().post(_urlListCategory,
          options: Options(
            headers: {HttpHeaders.authorizationHeader: 'Bearer $_token'},
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
            headers: {HttpHeaders.authorizationHeader: 'Bearer $_token'},
          ));
      food = Food.fromJson(response.data);
    } on DioError catch (e) {
      print(e.error);
    }
    return food.data.data;
  }

}
