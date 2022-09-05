import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:tasks/data/enums.dart';

class DateTimeProvider with ChangeNotifier {
  String ordinal(int number) {
    int i = number;
    String ordinal = '';

    if (i == 1 || i == 21 || i == 31) {
      ordinal = 'st';
    } else if (i == 2 || i == 22) {
      ordinal = 'nd';
    } else if (i == 3 || i == 23) {
      ordinal = 'rd';
    } else {
      ordinal = 'th';
    }

    return ordinal;
  }

  Wrap date(BuildContext context, ColorScheme? lightDynamic, DateTime dateTime,
      double? textSize) {
    DateTime currentDateTime = dateTime;
    ThemeData themeData = Theme.of(context);
    double? fontSize = textSize ?? 10;
    return Wrap(
      direction: Axis.horizontal,
      children: [
        Text(currentDateTime.day.toString(),
            style: TextStyle(
              color: lightDynamic?.secondary ?? themeData.secondaryHeaderColor,
              fontSize: fontSize,
            )),
        Text(ordinal(currentDateTime.day),
            style: TextStyle(
                color:
                    lightDynamic?.secondary ?? themeData.secondaryHeaderColor,
                fontSize: fontSize - 4,
                fontFeatures: const [FontFeature.superscripts()])),
        Padding(
          padding: const EdgeInsets.only(left: 2.0),
          child: Text(Months.values[currentDateTime.month-1].name,
              style: TextStyle(
                color:
                    lightDynamic?.secondary ?? themeData.secondaryHeaderColor,
                fontSize: fontSize,
              )),
        ),
      ],
    );
  }
}
