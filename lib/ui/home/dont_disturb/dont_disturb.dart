import 'package:flutter/material.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';

class DontDisturb extends StatefulWidget {
  @override
  _DontDisturbState createState() => _DontDisturbState();
}

class _DontDisturbState extends State<DontDisturb> {

  DateTime dateTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Please clean my room at', style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15),),
            Padding(
              padding: const EdgeInsets.only(right: 17.5),
              child: TimePickerSpinner(
                is24HourMode: true,
                normalTextStyle: TextStyle(fontSize: 24, color: Colors.grey),
                highlightedTextStyle:
                TextStyle(fontSize: 24, color: Colors.black),
                spacing: 20,
                itemHeight: 60,
                isForce2Digits: true,
                onTimeChange: (time) {
                  setState(() {
                    dateTime = time;
                  });
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {
                print(dateTime);
              },
              child: Text('Submit'),
              style: ElevatedButton.styleFrom(
                primary: Color(0xff008577), // background
                onPrimary: Colors.white, // foreground
              ),
            ),
          ],
        ),
      ),
    );
  }
}

