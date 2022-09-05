import 'dart:ui';
import 'package:flutter/material.dart';

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

  String month(int i) {
    String m = '';
    switch (i) {
      case 1:
        m = 'Jan';
        break;
      case 2:
        m = 'Feb';
        break;
      case 3:
        m = 'Mar';
        break;
      case 4:
        m = 'Apr';
        break;
      case 5:
        m = 'May';
        break;
      case 6:
        m = 'Jun';
        break;
      case 7:
        m = 'Jul';
        break;
      case 8:
        m = 'Aug';
        break;
      case 9:
        m = 'Sept';
        break;
      case 10:
        m = 'Oct';
        break;
      case 11:
        m = 'Nov';
        break;
      case 12:
        m = 'Dec';
        break;
    }
    return m;
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
          child: Text(month(currentDateTime.month),
              style: TextStyle(
                color:
                    lightDynamic?.secondary ?? themeData.secondaryHeaderColor,
                fontSize: fontSize,
              )),
        ),
      ],
    );
  }

  String weekday(int weekdayNum) {
    late String day;
    switch (weekdayNum) {
      case 1:
        day = 'Monday';
        break;
      case 2:
        day = 'Tuesday';
        break;
      case 3:
        day = 'Wednesday';
        break;
      case 4:
        day = 'Thursday';
        break;
      case 5:
        day = 'Friday';
        break;
      case 6:
        day = 'Saturday';
        break;
      case 7:
        day = 'Sunday';
        break;
    }
    return day;
  }
}
