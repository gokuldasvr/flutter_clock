import 'package:flutter/material.dart';
import 'package:flutter_clock/widgets/ui_leaf.dart';
import 'dart:async';

class HomePageClock extends StatefulWidget {
  @override
  _ClockState createState() => _ClockState();
}

class _ClockState extends State<HomePageClock> {
  // Declaring Variables for Hour, Min, Seconds
  var hour = 0, min = 0, sec = 0;

  // Declaring colors for Hour & Mins leaf
  var hourColor = Color.fromRGBO(94, 35, 245, 1);
  var minColor = Color.fromRGBO(196, 14, 69, 1);

  @override
  void initState() {
    DateTime _now = DateTime.now();
    Timer.periodic(Duration(seconds: 1), (callback) {
      // Getting Current Date and Time
      _now = DateTime.now().toLocal();
      if (hour != _now.hour) {
        setState(() {
          hour = _now.hour;
        });
      }
      if (min != _now.minute) {
        setState(() {
          min = _now.minute;
        });
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: AspectRatio(
            aspectRatio: 5/3,
            child: Stack(
              children: <Widget>[
                UIClockLeaf(
                  sec: min % 60,
                  size: 200,
                  minValue: 0,
                  maxValue: 60,
                  color: minColor,
                ),
                UIClockLeaf(
                  sec: hour % 12,
                  size: 150,
                  minValue: 0,
                  maxValue: 12,
                  color: hourColor,
                ),
                Center(
                  child: Text(
                    "$hour : $min",
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        fontFamily: 'Quicksand',
                        fontWeight: FontWeight.w800),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
