import 'package:fluent/design_system/fluent_icons_filled.dart';
import 'package:fluent/design_system/fluent_icons_outlined.dart';
import 'package:fluent/design_system/fluent_size.dart';
import 'package:fluent/design_system/typography.dart';
import 'package:fluent/widgets/badges/ios_badges.dart';
import 'package:fluent/widgets/notifications/ios_notification.dart';
import 'package:fluent/widgets/snackbar/fluent_snackbar.dart';
import 'package:fluent/widgets/tabbar/fluent_tabbar.dart';
import 'package:fluent/widgets/tooltip/fluent_tooltip.dart';
import 'package:fluent/widgets/tooltip/tooltip_painter.dart';
import 'package:flutter/material.dart';

import 'design_system/colors.dart';
import 'widgets/buttons/fluent_android_primary_button.dart';
import 'widgets/buttons/fluent_ios_outlined_button.dart';
import 'widgets/buttons/fluent_ios_primary_button.dart';
import 'widgets/buttons/fluent_ios_text_button.dart';
import 'widgets/appbar/fluent_appbar.dart';
import 'widgets/chips/fluent_chips.dart';
import 'widgets/fluent_avatar.dart';
import 'widgets/appbar/fluent_searchbar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Fluent',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: TestPage());
  }
}

class TestPage extends StatelessWidget {
  GlobalKey<ScaffoldState> testPage = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        key: testPage,
        // backgroundColor: Colors.black,
        appBar: FluentAppBar(
          title: 'Title',
          leftIcon: Icon(
            FluentIconsOutlined.android_person_outline,
            color: FluentColors.white,
          ),
          isMenuOnly: true,
          actions: [
            IconButton(
              icon: Icon(FluentIconsFilled.android_mail),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(FluentIconsFilled.android_mail),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(FluentIconsFilled.android_mail),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(FluentIconsFilled.android_mail),
              onPressed: () {},
            ),
          ],
        ),
        bottomNavigationBar: BottomTabBar(
          items: [
            BottomTabBarItem(icon: FluentIconsFilled.ios_add, onPressed: () {})
          ],
        ),
        body: FluentToolTip(
          type: FluentToolType.Bottom,
          isAndroid: true,
          text:
              'asdasdasdadsasdasdasdasdasdasdasdasdasdadasdasdasdadsasdasdasdasdasdasdasdasdasdadasdasdasdadsasdasdasdasdasdasdasdasdasdad',
        ));
  }
}
