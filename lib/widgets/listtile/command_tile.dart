import 'package:fluent/design_system/colors.dart';
import 'package:fluent/design_system/typography.dart';
import 'package:flutter/material.dart';

class CommandTile extends StatelessWidget {
  IconData leading;
  Color color;
  String title;
  Function onTap;
  CommandTile(
      {@required this.color,
      this.leading,
      @required this.title,
      @required this.onTap});
  @override
  Widget build(BuildContext context) {
    return ListTile(
        onTap: onTap,
        title: Text(
          title,
          style: FluentTextStyle.subheading2.copyWith(color: color),
        ),
        leading: IconButton(
          icon: Icon(leading, color: color),
          onPressed: onTap,
        ));
  }
}
