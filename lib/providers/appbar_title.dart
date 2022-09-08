import 'dart:ui';

import 'package:flutter/material.dart';

import '../data/algos.dart';
import '../data/enums.dart';

class AppBarTitle with ChangeNotifier {
  Widget? appBarTitle;

  AppBarTitle(DateTime currentDateTime, ColorScheme colorScheme) {
    appBarTitle = Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          DaysOfWeek.values[currentDateTime.weekday - 1].name,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w300,
            color: colorScheme.primary,
          ),
        ),
        Wrap(
          children: [
            Text(
              currentDateTime.day.toString(),
              style: TextStyle(
                color: colorScheme.secondary,
                fontSize: 10,
              ),
            ),
            Text(ordinal(currentDateTime.day),
                style: TextStyle(
                    color: colorScheme.secondary,
                    fontSize: 6,
                    fontFeatures: const [FontFeature.superscripts()])),
            Padding(
              padding: const EdgeInsets.only(left: 2.0),
              child: Text(Months.values[currentDateTime.month - 1].name,
                  style: TextStyle(
                    color: colorScheme.secondary,
                    fontSize: 10,
                  )),
            ),
          ],
        )
      ],
    );
  }

  void todayTitle(DateTime currentDateTime, ColorScheme colorScheme) {
    appBarTitle = Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          DaysOfWeek.values[currentDateTime.weekday - 1].name,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w300,
            color: colorScheme.primary,
          ),
        ),
        Wrap(
          children: [
            Text(
              currentDateTime.day.toString(),
              style: TextStyle(
                color: colorScheme.secondary,
                fontSize: 10,
              ),
            ),
            Text(ordinal(currentDateTime.day),
                style: TextStyle(
                    color: colorScheme.secondary,
                    fontSize: 6,
                    fontFeatures: const [FontFeature.superscripts()])),
            Padding(
              padding: const EdgeInsets.only(left: 2.0),
              child: Text(Months.values[currentDateTime.month - 1].name,
                  style: TextStyle(
                    color: colorScheme.secondary,
                    fontSize: 10,
                  )),
            ),
          ],
        )
      ],
    );
    notifyListeners();
  }
}
