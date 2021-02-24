import 'package:fluent/design_system/fluent_icons_filled.dart';
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
      appBar: FluentSearchAppBar(
        title: 'Title',
        searchLabel: 'Search',
        preffixIcon: Icon(
          FluentIconsFilled.ios_search,
          color: FluentColors.white,
        ),
        suffixIcon: Icon(
          FluentIconsFilled.ios_chat,
          color: FluentColors.white,
        ),
        // accountSwitcher: FluentAvatar(fluentSize: FluentSize.SMALL),
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
