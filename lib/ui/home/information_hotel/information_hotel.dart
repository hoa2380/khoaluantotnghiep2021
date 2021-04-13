import 'package:flutter/material.dart';

class InformationHotel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          alignment: Alignment.center,
          margin: EdgeInsets.all(20),
          height: 200,
          width:double.infinity,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow:[
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 2),
                ),
              ]
          ),
          child: Center(
            child: Text('HOTEL REGULATIONS', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Color(0xff669DA9)),),
          ),
        ),
        Container(
          alignment: Alignment.center,
          margin: EdgeInsets.all(20),
          height: 200,
          width:double.infinity,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow:[
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 2),
                ),
              ]
          ),
          child: Center(
            child: Text('SERVICES', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Color(0xff669DA9)),),
          ),
        ),
      ],
    );
  }
}
