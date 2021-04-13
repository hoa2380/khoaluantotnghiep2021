import 'package:flutter/material.dart';

class HotelRegulations extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                  child: Image.network(
                    "http://app.dean.vn:9090/uploads/1/file_1578751918988.png",
                    fit: BoxFit.cover,
                  )
              ),
            ],
          ),
        )
    );
  }
}
