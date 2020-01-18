import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_clock/screens/page_home.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  /*
  * Setting Screen rotation to Landscape
  * */
  SystemChrome.setEnabledSystemUIOverlays([]);
  SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,])
      .then((_) {
    // Running app
    runApp(new ClockApp());
  });
}

class ClockApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material Clock',
      debugShowCheckedModeBanner: false,
      home: HomePageClock(),
      theme: ThemeData(fontFamily: 'Quicksand'),
    );
  }
}