import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khoaluantotnghiep2021/controller/home/activity_service/activity_service_controller.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ActivityServicePage extends StatefulWidget {
  @override
  _ActivityServicePageState createState() => _ActivityServicePageState();
}

class _ActivityServicePageState extends State<ActivityServicePage> {

  final ActivityServiceController activityServiceController = Get.put(ActivityServiceController());
  num position = 1 ;


  @override
  Widget build(BuildContext context) {
    return urlActivity();
  }

  Widget urlActivity() {
    return Obx(() {
      if (activityServiceController.isLoading.value)
        return Center(child: CircularProgressIndicator());
      else
        return IndexedStack(
          index: position,
          children: [
            WebView(
              initialUrl: activityServiceController.url,
              javascriptMode: JavascriptMode.unrestricted,
              onPageStarted: (value) {
                setState(() {
                  position = 1;
                });
              },
              onPageFinished: (value) {
                setState(() {
                  position = 0;
                });
              },
            ),
            Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            )
          ],
        );
    });
  }
}
