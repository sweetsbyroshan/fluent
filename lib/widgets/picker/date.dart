import 'package:fluent/design_system/colors.dart';
import 'package:fluent/design_system/typography.dart';
import 'package:fluent/widgets/picker/GenerateCalendar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateWidget extends StatelessWidget {
  DateTime fDateTime;
  bool isSelected;
  DateWidget({this.fDateTime, this.isSelected = false});
  @override
  Widget build(BuildContext context) {
    bool isToday = fDateTime.day == DateTime.now().day &&
        fDateTime.month == DateTime.now().month &&
        fDateTime.year == DateTime.now().year;
    return Container(
      decoration: BoxDecoration(
          color: FluentColors.white,
          border:
              Border(bottom: BorderSide(width: .5, color: FluentColors.gray))),
      child: Container(
        margin: EdgeInsets.all(isSelected == true ? 4 : 0),
        decoration: BoxDecoration(
          color: isSelected == true
              ? FluentColors.blue
              : (isSelected != true && isToday == true)
                  ? FluentColors.blueTint.shade30
                  : fDateTime.month % 2 != 0
                      ? FluentColors.white
                      : FluentColors.gray.shade25,
          shape: isSelected == true
              ? BoxShape.circle
              : (isSelected != true && isToday == true)
                  ? BoxShape.rectangle
                  : BoxShape.rectangle,
        ),
        alignment: Alignment.center,
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Visibility(
                visible: fDateTime.day == 1,
                child: Text(DateFormat.MMM().format(fDateTime)),
              ),
              Text(
                fDateTime.day.toString(),
                style: FluentTextStyle.subhead.copyWith(
                    color: isSelected == true
                        ? FluentColors.white
                        : (isSelected != true && isToday == true)
                            ? FluentColors.blue
                            : FluentColors.black),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
