import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ActivityService extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: WebView(
            initialUrl: "https://seatrekvietnam.com/",
            javascriptMode: JavascriptMode.unrestricted,
          ),
        ),
      ],
    );
  }
}
