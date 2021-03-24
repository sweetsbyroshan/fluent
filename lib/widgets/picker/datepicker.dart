import 'package:fluent/design_system/colors.dart';
import 'package:fluent/design_system/fluent_icons_outlined.dart';
import 'package:fluent/design_system/typography.dart';
import 'package:fluent/widgets/picker/GenerateCalendar.dart';
import 'package:fluent/widgets/picker/date.dart';
import 'package:fluent/widgets/picker/date_vertical.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AndroidDatePicker extends StatefulWidget {
  Function(DateTime) onDateSelected;
  AndroidDatePicker({@required this.onDateSelected});
  @override
  _AndroidDatePickerState createState() => _AndroidDatePickerState();
}

class _AndroidDatePickerState extends State<AndroidDatePicker>
    with TickerProviderStateMixin {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    GenerateCalendar();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _controller.jumpTo(scrollTo);
    });
  }

  var _controller = ScrollController(debugLabel: 'cal');
  double scrollTo = 0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    scrollTo = (14 ~/ 7) * (268 - (168 - size.width / 6) / (size.width / 6));
    return Center(
      child: Column(
        children: [
          PhysicalModel(
            elevation: 2,
            color: FluentColors.white,
            shadowColor: FluentColors.gray,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                      bottom: BorderSide(
                          color: FluentColors.gray.shade100, width: .5))),
              width: MediaQuery.of(context).size.width * .9,
              padding: EdgeInsets.only(bottom: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    tileColor: FluentColors.white,
                    leading: IconButton(
                      icon: Icon(
                        FluentIconsOutlined.android_dismiss_outline,
                        color: FluentColors.blue,
                        size: 28,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    title: Text(
                      'Choose Date',
                      style: FluentTextStyle.body2
                          .copyWith(color: FluentColors.blue, fontSize: 24),
                    ),
                    trailing: IconButton(
                        icon: Icon(
                          FluentIconsOutlined.android_checkmark_outline,
                          color: FluentColors.blue,
                          size: 32,
                        ),
                        onPressed: () {
                          widget.onDateSelected(selectedDate);
                          Navigator.pop(context);
                        }), //call dissmiss
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 32),
                    child: Text(
                      DateFormat.EEEE()
                          .addPattern(', MMM dd')
                          .format(selectedDate)
                          .toUpperCase(),
                      style: FluentTextStyle.body2
                          .copyWith(color: FluentColors.blue),
                    ),
                  )
                ],
              ),
            ),
          ),
          PhysicalModel(
            elevation: 2,
            color: FluentColors.white,
            shadowColor: FluentColors.gray,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * .9,
                  height: 350,
                  child: GridView.builder(
                      controller: _controller,
                      shrinkWrap: true,
                      primary: false,
                      padding: EdgeInsets.only(right: 16, left: 16),
                      itemCount: GenerateCalendar.CALENDAR.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 7, childAspectRatio: .8),
                      itemBuilder: (c, i) => InkWell(
                          onTap: () {
                            setState(() {
                              selectedDate = GenerateCalendar.CALENDAR[i];
                            });
                          },
                          child: DateWidget(
                            fDateTime: GenerateCalendar.CALENDAR[i],
                            isSelected: GenerateCalendar.CALENDAR[i].day ==
                                    selectedDate.day &&
                                GenerateCalendar.CALENDAR[i].month ==
                                    selectedDate.month &&
                                GenerateCalendar.CALENDAR[i].year ==
                                    selectedDate.year,
                          ))),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<String> week = ['S', 'M', 'T', 'W', 'T', 'F', 'S'];
  DateTime selectedDate = DateTime.now();
}
