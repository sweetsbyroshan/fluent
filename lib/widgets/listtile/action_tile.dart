import 'package:fluent/design_system/colors.dart';
import 'package:fluent/design_system/typography.dart';
import 'package:flutter/material.dart';

class ActionTile extends StatelessWidget {
  Color color;
  Widget title;
  Function action;
  String actionLabel;
  Widget trailing;
  ActionType actionType;
  ActionTile(
      {@required this.action,
      this.actionType = ActionType.Default,
      @required this.title,
      @required this.actionLabel,
      this.trailing});
  @override
  Widget build(BuildContext context) {
    return actionType == ActionType.Default
        ? ListTile(
            trailing: InkWell(
              borderRadius: BorderRadius.circular(3),
              child: Container(
                child: Text(
                  actionLabel,
                  style: FluentTextStyle.button2,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3),
                ),
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              ),
              onTap: action,
            ),
            title: title,
          )
        : ListTile(
            trailing: trailing,
            title: title,
          );
  }
}

enum ActionType { Default, Custom }
