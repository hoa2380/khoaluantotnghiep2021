
import 'package:get/get.dart';
import 'package:khoaluantotnghiep2021/ui/home/home_page.dart';
import 'package:khoaluantotnghiep2021/ui/login/login_page.dart';

part 'app_routes.dart';
class AppPages {
  static final pages = [
    GetPage(name: Routes.LOGIN, page:()=> LoginPage(),),
    GetPage(name: Routes.HOME, page:()=> HomePage(),),
  ];
}