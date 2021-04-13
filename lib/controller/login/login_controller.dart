import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:khoaluantotnghiep2021/data/model/room.dart';
import 'package:khoaluantotnghiep2021/ui/home/home_page.dart';
import 'package:khoaluantotnghiep2021/ui/theme/app_colors.dart';
import 'package:khoaluantotnghiep2021/utils/app_clients.dart';
import 'package:khoaluantotnghiep2021/utils/app_endpoint.dart';

class LoginController extends GetxController {
  TextEditingController textRoomName, textLabel;
  String roomName, label = '';
  String _apiUrl = AppEndpoint.CHECKROOMEXIST;
  Room room;

  checkRoomExist() async {
    if(textRoomName.text.isNotEmpty && textLabel.text.isNotEmpty){
      Map<String, String> data = {"roomName": '$roomName', "label": '$label'};
      try {
        final response = await AppClients().post(
          _apiUrl,
          data: data,
        );
        if(response.statusCode == 200) {
          room = Room.fromJson(response.data);
          print(response.statusMessage);
          print(room.success);
          print(room.data);
          if(room.success) {
            sleep(Duration(milliseconds: 1));
            Get.to(() => HomePage());
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
