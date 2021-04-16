import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khoaluantotnghiep2021/bindings/main_binding.dart';
import 'package:khoaluantotnghiep2021/resources/strings/localization_service.dart';
import 'package:khoaluantotnghiep2021/ui/login/login_page.dart';
import 'package:khoaluantotnghiep2021/ui/theme/app_theme.dart';

import 'routes/app_pages.dart';

void main() async {
  MainBinding().dependencies();
  runApp(
    GetMaterialApp(
      initialRoute: Routes.LOGIN,
      theme: appThemeData,
      getPages: AppPages.pages,
      home: LoginPage(),
      translations: LocalizationService(),
      locale: LocalizationService.locale,
      fallbackLocale: LocalizationService.fallbackLocale,
      defaultTransition: Transition.cupertino,
      transitionDuration: Get.defaultTransitionDuration,
      debugShowCheckedModeBanner: false,
    ),
  );
}

