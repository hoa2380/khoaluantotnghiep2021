import 'package:get/get.dart';
import 'package:khoaluantotnghiep2021/controller/home/activity_service/activity_service_provider.dart';
import 'package:khoaluantotnghiep2021/data/model/urlTour.dart';

class ActivityServiceController extends GetxController with SingleGetTickerProviderMixin {
  var isLoading = true.obs;
  var urlList = UrlTourData;

  void getUrlTourList() async {
    try {
      isLoading(true);
      var urls =  await ActivityServiceProvider().fetchUrlTourList();
      if(urlList != null){
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