import 'package:fluent/design_system/fluent_icons_filled.dart';
import 'package:fluent/design_system/fluent_icons_outlined.dart';
import 'package:fluent/widgets/fluent_size.dart';
import 'package:flutter/material.dart';

import 'design_system/colors.dart';
import 'widgets/buttons/fluent_ios_outlined_button.dart';
import 'widgets/buttons/fluent_ios_primary_button.dart';
import 'widgets/buttons/fluent_ios_text_button.dart';
import 'widgets/fluent_appbar.dart';
import 'widgets/fluent_avatar.dart';
import 'widgets/fluent_searchbar.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: Center(
        child: FluentIosTextButton(
          text: 'Default',
          onPressed: () {},
          // disabled: true,
        ),
      ),
    );
  }
}
