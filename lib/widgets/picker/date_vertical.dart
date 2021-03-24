import 'package:fluent/design_system/colors.dart';
import 'package:fluent/design_system/typography.dart';
import 'package:fluent/widgets/tooltip/fluent_tooltip.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'GenerateCalendar.dart';

class DateVertical extends StatelessWidget {
  DateTime dateTime;
  DateVertical({this.dateTime});
  @override
  Widget build(BuildContext context) {
    bool isToday = dateTime.day == DateTime.now().day &&
        dateTime.month == DateTime.now().month &&
        dateTime.year == DateTime.now().year;
    bool isYesterday = dateTime.day + 1 == DateTime.now().day &&
        dateTime.day + 2 > DateTime.now().day &&
        dateTime.month == DateTime.now().month &&
        dateTime.year == DateTime.now().year;
    bool isTommorrow = dateTime.day - 1 == DateTime.now().day &&
        dateTime.day - 2 < DateTime.now().day &&
        dateTime.month == DateTime.now().month &&
        dateTime.year == DateTime.now().year;

    return Container(
      constraints: BoxConstraints(minHeight: 48),
      child: Text(
        isYesterday
            ? 'Yesterday'
            : isToday
                ? 'Today'
                : isTommorrow
                    ? 'Tomorrow'
                    : DateFormat.E()
                        .addPattern(',')
                        .add_MMMd()
                        .format(dateTime),
        textAlign: TextAlign.center,
        style: FluentTextStyle.heading.copyWith(
            color: isToday == true ? FluentColors.blue : FluentColors.black),
      ),
    );
  }
}
