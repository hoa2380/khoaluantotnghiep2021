import 'package:get/get.dart';
import 'package:khoaluantotnghiep2021/data/model/laundry.dart';

import 'laundry_service_provider.dart';

class LaundryServiceController extends GetxController with SingleGetTickerProviderMixin {
  var isLoading = true.obs;
  var laundryList = <LaundryDatum>[].obs;

  void getFoodList() async {
    try {
      isLoading(true);
      var laundry =  await LaundryServiceProvider().fetchListLaundry();
      if(laundryList != null){
        laundryList.assignAll(laundry);
        print(laundryList);
      }
    } finally {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    getFoodList();
    super.onInit();
  }

  @override
  void onClose() {
    Get.delete();
    super.onClose();
  }

}