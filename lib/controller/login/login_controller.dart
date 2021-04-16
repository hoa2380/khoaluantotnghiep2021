import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:khoaluantotnghiep2021/data/model/room.dart';
import 'package:khoaluantotnghiep2021/data/model/user.dart';
import 'package:khoaluantotnghiep2021/ui/home/home_page.dart';
import 'package:khoaluantotnghiep2021/ui/theme/app_colors.dart';
import 'package:khoaluantotnghiep2021/utils/app_clients.dart';
import 'package:khoaluantotnghiep2021/utils/app_endpoint.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  TextEditingController textRoomName, textLabel;
  String roomName, label = '';
  String _urlCheckRoom = AppEndpoint.CHECK_ROOM_EXIST;
  String _urlLogin = AppEndpoint.LOGIN;
  Room room;
  User user;

  checkRoomExist() async {
    if(textRoomName.text.isNotEmpty && textLabel.text.isNotEmpty){
      Map<String, String> data = {"roomName": '$roomName', "label": '$label'};
      try {
        final response = await AppClients().post(
          _urlCheckRoom,
          data: data,
        );
        if(response.statusCode == 200) {
          room = Room.fromJson(response.data);
          print(response.statusMessage);
          print(room.success);
          print(room.data);
          if(room.success) {
            sleep(Duration(milliseconds: 1));
            login(label, roomName);
          }
        } else print('error');
      } on DioError catch (e) {
        sleep(Duration(milliseconds: 1));
        showDialog();
        print(e.error);
      }
    } else {
      showDialog();
    }
  }

  login(roomLabel, roomName) async {
    Map<String, String> data = {
      "username": '_room_' + '$roomLabel' + '_' + '$roomName' + '_',
      "password": '111111'};
    try {
      final response = await AppClients().post(
        _urlLogin,
        data: data,
      );
       user = User.fromJson(response.data);
      if(user.success) {
        Get.to(() => HomePage());
        print('token: ' + user.data.token + '\n' + user.data.user.toString());
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('user_token', user.data.token);
      } else showDialog();
    } on DioError catch (e) {
      sleep(Duration(milliseconds: 1));
      print(e.error);
    }
  }

  showDialog(){
    return Get.defaultDialog(
        title: "Login Failed",
        titleStyle: TextStyle(
          color: AppColors.primaryTextColor,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        content: Column(
          children: [
            Text("Please contact via manager!"),
            SizedBox(height: 10),
            TextButton(
              child: Text('Okay'),
              style: TextButton.styleFrom(
                textStyle: TextStyle(
                  fontSize: 12,
                ),
                primary: Colors.white,
                backgroundColor: AppColors.primaryColor,
              ),
              onPressed: () => Get.back(),
            ),
          ],
        ));
  }

  @override
  void onInit() {
    textRoomName = new TextEditingController();
    textLabel = new TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    textRoomName.dispose();
    textLabel.dispose();
    super.onClose();
  }
}
