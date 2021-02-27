import 'package:fluent/design_system/colors.dart';
import 'package:fluent/design_system/fluent_icons_filled.dart';
import 'package:fluent/design_system/typography.dart';
import 'package:fluent/widgets/buttons/fluent_android_primary_button.dart';
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

  static announcement({
    @required String text,
    @required String actionText,
    @required IconData fluentIcon,
    Duration duration,
    @required GlobalKey<ScaffoldState> scaffoldKey,
  }) {
    SnackBar snackBar = SnackBar(
      duration: duration ?? Duration(seconds: 4),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Icon(
                fluentIcon,
                color: FluentColors.white,
              ),
              SizedBox(width: 16),
              Text(
                text,
                style: FluentTextStyle.body1.copyWith(
                  color: FluentColors.white,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 8,
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: FluentAndroidButton(
                text: actionText,
                onPressed: () {
                  scaffoldKey.currentState.hideCurrentSnackBar(
                      reason: SnackBarClosedReason.dismiss);
                }),
          )
        ],
      ),
      backgroundColor: FluentColors.blue,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(4))),
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
    );

    scaffoldKey.currentState.showSnackBar(snackBar);
  }
}
