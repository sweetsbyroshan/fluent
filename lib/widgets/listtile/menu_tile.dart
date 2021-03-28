import 'package:fluent/design_system/colors.dart';
import 'package:fluent/design_system/typography.dart';
import 'package:flutter/material.dart';

class MenuTile extends StatelessWidget {
  Color color;
  String title;
  Function(bool) onChanged;
  bool groupValue, value;
  IconData leading;
  MenuTile(
      {this.color = FluentColors.black,
      @required this.value,
      this.leading,
      @required this.groupValue,
      @required this.title,
      @required this.onChanged});
  @override
  Widget build(BuildContext context) {
    return RadioListTile(
      controlAffinity: ListTileControlAffinity.trailing,
      title: Row(
        children: [
          Icon(
            leading,
            color: color == FluentColors.black
                ? FluentColors.gray.shade400
                : color,
          ),
          SizedBox(
            width: 11,
          ),
          Text(
            title,
            style: FluentTextStyle.subheading2.copyWith(color: color),
          ),
        ],
      ),
      groupValue: groupValue,
      onChanged: onChanged,
      value: value,
    );
  }
}
