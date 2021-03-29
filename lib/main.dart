import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khoaluantotnghiep2021/bindings/main_binding.dart';
import 'package:khoaluantotnghiep2021/resources/strings/localization_service.dart';
import 'package:khoaluantotnghiep2021/ui/home/home_page.dart';
import 'package:khoaluantotnghiep2021/ui/theme/app_theme.dart';

import 'routes/app_pages.dart';

void main() => runApp(
      GetMaterialApp(
        initialBinding: MainBinding(),
        initialRoute: Routes.INITIAL,
        theme: appThemeData,
        getPages: AppPages.pages,
        home: HomePage(),
        translations: LocalizationService(),
        locale: LocalizationService.locale,
        fallbackLocale: LocalizationService.fallbackLocale,
        defaultTransition: Transition.cupertino,
        transitionDuration: Get.defaultTransitionDuration,
        debugShowCheckedModeBanner: false,
      ),
    );

