import 'package:flutter/material.dart';

import 'circular_slider/appearance.dart';
import 'circular_slider/circular_slider.dart';

class UIClockLeaf extends StatelessWidget {
  final sec;
  final double size;
  final double minValue;
  final double maxValue;
  final Color color;

  UIClockLeaf({this.sec, this.size, this.minValue, this.maxValue,this.color});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SleekCircularSlider(
        appearance: CircularSliderAppearance(
            size: size,
            customWidths: CustomSliderWidths(progressBarWidth: 13, handlerSize: 0),
            startAngle: 270,
            angleRange: 360,
            customColors: CustomSliderColors(
              trackColor: Colors.transparent,
              progressBarColor: color,
            ),
            infoProperties: InfoProperties(
              modifier: (value) {
                return value.toString();
              },
            )),
        min: minValue,
        max: maxValue,
        initialValue: sec.toDouble(),
        innerWidget: (value) {
          return Text("");
        },
      ),
    );
  }
}
