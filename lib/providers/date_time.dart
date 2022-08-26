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
        m = 'January';
        break;
      case 2:
        m = 'February';
        break;
      case 3:
        m = 'March';
        break;
      case 4:
        m = 'April';
        break;
      case 5:
        m = 'May';
        break;
      case 6:
        m = 'June';
        break;
      case 7:
        m = 'July';
        break;
      case 8:
        m = 'August';
        break;
      case 9:
        m = 'September';
        break;
      case 10:
        m = 'October';
        break;
      case 11:
        m = 'November';
        break;
      case 12:
        m = 'December';
        break;
    }
    return m;
  }

  Wrap date(ColorScheme? lightDynamic) {
    DateTime currentDateTime = DateTime.now();
    return Wrap(
      direction: Axis.horizontal,
      children: [
        Text(currentDateTime.day.toString(),
            style: TextStyle(
              color: lightDynamic?.secondary,
              fontSize: 10,
            )),
        Text(ordinal(currentDateTime.day),
            style: TextStyle(
                color: lightDynamic?.secondary,
                fontSize: 6,
                fontFeatures: const [FontFeature.superscripts()])),
        Padding(
          padding: const EdgeInsets.only(left: 1.0),
          child: Text(month(currentDateTime.month),
              style: TextStyle(
                color: lightDynamic?.secondary,
                fontSize: 10,
              )),
        ),
      ],
    );
  }

  String weekday() {
    DateTime currentDateTime = DateTime.now();
    late String day;
    switch (currentDateTime.weekday) {
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
