import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:khoaluantotnghiep2021/controller/login/login_controller.dart';
import 'package:khoaluantotnghiep2021/ui/theme/app_colors.dart';

class LoginPage extends GetView<LoginController> {
  double height, width;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: GetBuilder(
        init: controller,
        builder: (_) {
          return Center(
            child: Container(
              height: height * 0.55,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              margin: EdgeInsets.symmetric(horizontal: 24),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blueGrey.withOpacity(0.2),
                      spreadRadius: 6,
                      blurRadius: 7,
                      offset: Offset(0, 2),
                    ),
                  ]),
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/ic_logo_app_foreground.png',
                    height: 140,),
                  SizedBox(height: height * 0.05),
                  TextField(
                    controller: controller.textRoomName,
                    onChanged: (value) => controller.roomName = value,
                    autofocus: false,
                    style:
                    TextStyle(fontSize: 20, color: AppColors.primaryTextColor),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Room Name',
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(width: 1.5, color: Colors.black54),
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.04),
                  TextField(
                    controller: controller.textLabel,
                    onChanged: (value) => controller.label = value,
                    autofocus: false,
                    style: TextStyle(
                        fontSize: 20, color: AppColors.primaryTextColor),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'A',
                      hintStyle: TextStyle(color: Colors.black87),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            width: 1.5,
                            color: Colors.black54),
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.03),
                  Container(
                    width: width * 1.0,
                    child: TextButton(
                      child: Text('Sign In'),
                      style: TextButton.styleFrom(
                        textStyle: TextStyle(
                          fontSize: 20,
                        ),
                        primary: Colors.white,
                        backgroundColor: AppColors.primaryColor,
                      ),
                      onPressed: () => controller.checkRoomExist(),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
