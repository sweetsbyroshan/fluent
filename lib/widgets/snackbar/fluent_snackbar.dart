import 'package:fluent/design_system/colors.dart';
import 'package:fluent/design_system/typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FluentSnackbar {
  static show(
      {@required String text,
      SnackBarAction action,
      Duration duration,
      @required GlobalKey<ScaffoldState> scaffoldKey}) {
    SnackBarAction actualAction = SnackBarAction(
      label: action.label,
      onPressed: action.onPressed,
      textColor: FluentColors.white,
      disabledTextColor: FluentColors.gray.shade500,
    );
    SnackBar snackBar = SnackBar(
      duration: duration ?? Duration(seconds: 4),
      content: Text(
        text,
        style: FluentTextStyle.body1.copyWith(
          color: FluentColors.white,
        ),
      ),
      backgroundColor: FluentColors.black,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(4))),
      action: actualAction,
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
    );
    scaffoldKey.currentState.showSnackBar(snackBar);
  }

  static withCustomWidget(
      {@required String text,
      Duration duration,
      @required GlobalKey<ScaffoldState> scaffoldKey,
      @required Widget widget}) {
    SnackBar snackBar = SnackBar(
      duration: duration ?? Duration(seconds: 4),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            text,
            style: FluentTextStyle.body1.copyWith(
              color: FluentColors.white,
            ),
          ),
          SizedBox(
            height: 8,
          ),
          widget
        ],
      ),
      backgroundColor: FluentColors.black,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(4))),
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
    );

    scaffoldKey.currentState.showSnackBar(snackBar);
  }
}
