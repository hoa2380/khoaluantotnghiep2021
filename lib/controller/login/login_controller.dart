import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:khoaluantotnghiep2021/controller/login/login_provider.dart';
import 'package:khoaluantotnghiep2021/data/model/room.dart';
import 'package:khoaluantotnghiep2021/data/model/user.dart';
import 'package:khoaluantotnghiep2021/ui/home/home_page.dart';
import 'package:khoaluantotnghiep2021/ui/theme/app_colors.dart';

class LoginController extends GetxController {
  TextEditingController textRoomName, textLabel;
  var isLoading = true.obs;
  String roomName, label = '';
  var guestName = ''.obs;
  var room = Room().obs;
  var user = User().obs;

  void checkRoomExist() async {
    if (textRoomName.text.isNotEmpty && textLabel.text.isNotEmpty) {
      try {
        isLoading(true);
        var roomData = await LoginProvider().checkRoomExistRequest(roomName, label);
        if (room != null) {
          room.value = roomData;
          login(label, roomName);
          guestName.value = room.value.data.customerName;
          print(guestName);
          print(room.value.success);
          print(room.value.data);
        }
      }
      catch(e) {
        showDialog();
      }
      finally {
        isLoading(false);
      }
    } else showDialog();
  }

  void login(roomLabel, roomName) async {
    try {
      isLoading(true);
      var userData = await LoginProvider().loginRequest(roomLabel, roomName);
      if (user != null) {
        user.value = userData;
        print(user.value.data.user);
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('user_token', user.value.data.token);
        Get.to(() => HomePage());
      }
    } finally {
      isLoading(false);
    }
  }

  showDialog() {
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