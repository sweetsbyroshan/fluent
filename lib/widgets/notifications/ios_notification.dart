import 'package:fluent/design_system/colors.dart';
import 'package:fluent/design_system/typography.dart';
import 'package:flutter/material.dart';

class IosNotificaiton {
  static standard(
      {@required String text,
      Duration duration,
      @required GlobalKey<ScaffoldState> scaffoldKey}) {
    SnackBar snackBar = SnackBar(
      duration: duration ?? Duration(seconds: 4),
      content: Text(
        text,
        textAlign: TextAlign.center,
        style: FluentTextStyle.subhead.copyWith(
          color: FluentColors.blue,
        ),
      ),
      backgroundColor: FluentColors.white,
      shape:
          Border(top: BorderSide(color: FluentColors.gray.shade100, width: 1)),
      padding: EdgeInsets.symmetric(vertical: 14, horizontal: 10),
    );
    scaffoldKey.currentState.hideCurrentSnackBar();
    scaffoldKey.currentState.showSnackBar(snackBar);
  }

  static warning(
      {@required String text,
      Duration duration,
      @required GlobalKey<ScaffoldState> scaffoldKey}) {
    SnackBar snackBar = SnackBar(
      duration: duration ?? Duration(seconds: 4),
      content: Text(
        text,
        textAlign: TextAlign.center,
        style: FluentTextStyle.subhead.copyWith(
          color: FluentColors.gray.shade700,
        ),
      ),
      backgroundColor: FluentColors.gray.shade100,
      shape:
          Border(top: BorderSide(color: FluentColors.gray.shade100, width: 1)),
      padding: EdgeInsets.symmetric(vertical: 14, horizontal: 10),
    );
    scaffoldKey.currentState.hideCurrentSnackBar();
    scaffoldKey.currentState.showSnackBar(snackBar);
  }

  static progress(
      {@required String text,
      Duration duration,
      @required GlobalKey<ScaffoldState> scaffoldKey}) {
    SnackBar snackBar = SnackBar(
      duration: duration ?? Duration(seconds: 4),
      content: Text(
        text,
        textAlign: TextAlign.center,
        style: FluentTextStyle.subhead.copyWith(
          color: FluentColors.blue,
        ),
      ),
      backgroundColor: FluentColors.blueTint.shade30,
      shape:
          Border(top: BorderSide(color: FluentColors.gray.shade100, width: 1)),
      padding: EdgeInsets.symmetric(vertical: 14, horizontal: 10),
    );
    scaffoldKey.currentState.hideCurrentSnackBar();
    scaffoldKey.currentState.showSnackBar(snackBar);
  }
}

enum NotificationType { standard, error, progress }
