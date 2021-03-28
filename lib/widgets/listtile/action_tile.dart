import 'package:fluent/design_system/colors.dart';
import 'package:fluent/design_system/typography.dart';
import 'package:flutter/material.dart';

class ActionTile extends StatelessWidget {
  Color color;
  Widget title;
  Function action;
  String actionLabel;
  ActionTile({
    @required this.action,
    @required this.title,
    @required this.actionLabel,
  });
  @override
  Widget build(BuildContext context) {
    return ListTile(
      trailing: InkWell(
        borderRadius: BorderRadius.circular(3),
        child: Container(
          child: Text(actionLabel),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(3),
          ),
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        ),
        onTap: action,
      ),
      title: title,
    );
  }
}
