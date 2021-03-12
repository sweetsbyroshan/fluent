import 'package:fluent/design_system/colors.dart';
import 'package:fluent/design_system/fluent_icons_filled.dart';
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

  static toast(
      {@required String text,
      SnackBarAction action,
      Duration duration,
      @required GlobalKey<ScaffoldState> scaffoldKey}) {
    SnackBarAction actualAction = SnackBarAction(
      label: action.label,
      onPressed: action.onPressed,
      textColor: FluentColors.blue,
      disabledTextColor: FluentColors.gray.shade500,
    );
    SnackBar snackBar = SnackBar(
      duration: duration ?? Duration(seconds: 4),
      content: Text(
        text,
        style: FluentTextStyle.body1.copyWith(
          color: FluentColors.blue,
        ),
      ),
      backgroundColor: FluentColors.blueTint.shade30,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(4))),
      action: actualAction,
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
    );
    scaffoldKey.currentState.showSnackBar(snackBar);
  }

  static subtitleToast({
    @required String text,
    @required String subtitle,
    Duration duration,
    @required GlobalKey<ScaffoldState> scaffoldKey,
  }) {
    SnackBar snackBar = SnackBar(
      duration: duration ?? Duration(seconds: 4),
      content: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                text,
                style: FluentTextStyle.headlineIOS.copyWith(
                  color: FluentColors.blue,
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                text,
                style: FluentTextStyle.subhead.copyWith(
                  color: FluentColors.blue,
                ),
              ),
            ],
          ),
          IconButton(
              icon: Icon(
                FluentIconsFilled.ios_dismiss,
                color: FluentColors.blue,
              ),
              onPressed: () {
                scaffoldKey.currentState
                    .hideCurrentSnackBar(reason: SnackBarClosedReason.dismiss);
              })
        ],
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
      ),
      backgroundColor: FluentColors.blueTint.shade30,
      margin: EdgeInsets.symmetric(horizontal: 4, vertical: 8),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 0,
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 14),
    );

    scaffoldKey.currentState.showSnackBar(snackBar);
  }

  static toastIconedSubtitle({
    @required String text,
    @required String subtitle,
    Duration duration,
    IconData iconData,
    @required GlobalKey<ScaffoldState> scaffoldKey,
  }) {
    SnackBar snackBar = SnackBar(
      duration: duration ?? Duration(seconds: 4),
      content: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                iconData,
                color: FluentColors.blue,
              ),
              SizedBox(
                width: 16,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    text,
                    style: FluentTextStyle.headlineIOS.copyWith(
                      color: FluentColors.blue,
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    text,
                    style: FluentTextStyle.subhead.copyWith(
                      color: FluentColors.blue,
                    ),
                  ),
                ],
              ),
            ],
          ),
          IconButton(
              icon: Icon(
                FluentIconsFilled.ios_dismiss,
                color: FluentColors.blue,
              ),
              onPressed: () {
                scaffoldKey.currentState
                    .hideCurrentSnackBar(reason: SnackBarClosedReason.dismiss);
              })
        ],
      ),
      backgroundColor: FluentColors.blueTint.shade30,
      margin: EdgeInsets.symmetric(horizontal: 4, vertical: 8),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 0,
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 14),
    );

    scaffoldKey.currentState.showSnackBar(snackBar);
  }
}
