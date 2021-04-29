import 'package:get/get.dart';
import 'package:khoaluantotnghiep2021/controller/home/activity_service/activity_service_provider.dart';

class ActivityServiceController extends GetxController with SingleGetTickerProviderMixin {
  var isLoading = true.obs;
  String  url;

  void getUrlTourList() async {
    try {
      isLoading(true);
      var urls =  await ActivityServiceProvider().fetchUrlTourList();
      url = urls.url;
      print(url);
      if(url != null){
      }
    } finally {
      isLoading(false);
    }
  }
  @override
  void onInit() {
    getUrlTourList();
    super.onInit();
  }

  @override
  void onClose() {
    Get.delete();
    super.onClose();
  }

}