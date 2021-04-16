import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khoaluantotnghiep2021/controller/home/activity_service/activity_service_controller.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ActivityService extends GetView<ActivityServiceController> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: UrlActivity()
        )
      ],
    );
  }

  Widget UrlActivity() {
    return Obx(() {
      if (controller.isLoading.value)
        return Center(child: CircularProgressIndicator());
      else
        return WebView(
          initialUrl: "https://seatrekvietnam.com/tour/",
          javascriptMode: JavascriptMode.unrestricted,
        );
    });
  }

}


