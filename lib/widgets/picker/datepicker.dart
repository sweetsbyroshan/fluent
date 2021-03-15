import 'package:fluent/design_system/colors.dart';
import 'package:fluent/design_system/typography.dart';
import 'package:fluent/widgets/picker/GenerateCalendar.dart';
import 'package:fluent/widgets/picker/date.dart';
import 'package:fluent/widgets/picker/date_vertical.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AndroidDatePicker extends StatefulWidget {
  @override
  _AndroidDatePickerState createState() => _AndroidDatePickerState();
}

class _AndroidDatePickerState extends State<AndroidDatePicker>
    with TickerProviderStateMixin {
  double scrollTo = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    GenerateCalendar();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_tabController.index == 0) _controller.jumpTo(scrollTo);
    });
  }

  var _tabController;
  var _controller = ScrollController(debugLabel: 'cal');
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    scrollTo = (14 ~/ 7) * (268 - (168 - size.width / 6) / (size.width / 6));
    _tabController = TabController(initialIndex: 1, length: 2, vsync: this);
    var _pageController = PageController(initialPage: 1);
    _tabController.addListener(() {
      _pageController.animateToPage(_tabController.index,
          duration: Duration(milliseconds: 200), curve: Curves.easeIn);
    });

    return Center(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(right: 25, left: 25),
            width: MediaQuery.of(context).size.width * .8,
            child: TabBar(
              labelColor: FluentColors.blue,
              controller: _tabController,
              tabs: [
                Tab(
                  text: DateFormat.EEEE()
                      .addPattern('', ',')
                      .add_MMMd()
                      .format(selectedDate),
                ),
                Tab(
                  text: '12PM',
                ),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * .8,
            height: 268,
            child: PageView(
              controller: _pageController,
              physics: NeverScrollableScrollPhysics(),
              children: [
                GridView.builder(
                    controller: _controller,
                    shrinkWrap: true,
                    primary: false,
                    padding: EdgeInsets.only(right: 25, left: 25),
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
                Row(
                  children: [
                    Flexible(
                      child: Container(
                        height: 268,
                        child: ListView.builder(
                          itemBuilder: (c, i) => DateVertical(
                            dateTime: GenerateCalendar.CALENDAR[i],
                          ),
                          itemCount: GenerateCalendar.CALENDAR.length,
                          shrinkWrap: true,
                          primary: false,
                        ),
                      ),
                    ),
                    Flexible(
                      child: Container(
                        height: 268,
                        child: ListView(
                          children: List.generate(12, (index) => index + 1)
                              .map((e) => Container(
                                    constraints: BoxConstraints(minHeight: 48),
                                    child: Text(
                                      e.toString(),
                                      textAlign: TextAlign.center,
                                      style: FluentTextStyle.heading.copyWith(
                                          color: false == true
                                              ? FluentColors.blue
                                              : FluentColors.black),
                                    ),
                                  ))
                              .toList(),
                          shrinkWrap: true,
                          primary: false,
                        ),
                      ),
                    ),
                    Flexible(
                      child: Container(
                        height: 268,
                        child: ListView(
                          children: List.generate(59, (index) => index + 1)
                              .map((e) => Container(
                                    constraints: BoxConstraints(minHeight: 48),
                                    child: Text(
                                      e.toString(),
                                      textAlign: TextAlign.center,
                                      style: FluentTextStyle.heading.copyWith(
                                          color: false == true
                                              ? FluentColors.blue
                                              : FluentColors.black),
                                    ),
                                  ))
                              .toList(),
                          shrinkWrap: true,
                          primary: false,
                        ),
                      ),
                    ),
                  ],
                )
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
