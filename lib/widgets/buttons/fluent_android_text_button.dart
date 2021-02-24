import 'package:fluent/design_system/colors.dart';
import 'package:fluent/design_system/typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FluentAndroidTextButton extends StatefulWidget {
  String text;
  FluentAndroidTextButton({
    @required this.text,
    @required this.onPressed,
    this.disabled = false,
  });
  bool disabled;
  Function onPressed;
  @override
  _FluentAndroidTextButtonState createState() =>
      _FluentAndroidTextButtonState();
}

class _FluentAndroidTextButtonState extends State<FluentAndroidTextButton> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: FluentColors.transparent,
      child: InkWell(
        splashColor: FluentColors.gray.shade50,
        onTap: widget.disabled == true ? null : widget.onPressed,
        child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2),
            ),
            constraints: BoxConstraints(minHeight: 36, minWidth: 89),
            child: Text(
              widget.text,
              textAlign: TextAlign.center,
              style: FluentTextStyle.button1.copyWith(
                textBaseline: TextBaseline.ideographic,
                color: widget.disabled == true
                    ? FluentColors.gray.shade300
                    : FluentColors.blue,
              ),
            ),
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16)),
      ),
    );
  }
}
