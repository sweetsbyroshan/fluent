import 'package:fluent/design_system/colors.dart';
import 'package:fluent/design_system/typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FluentAndroidButton extends StatefulWidget {
  String text;
  FluentAndroidButton({
    @required this.text,
    @required this.onPressed,
    this.disabled = false,
  });
  bool disabled;
  Function onPressed;
  @override
  _FluentAndroidButtonState createState() => _FluentAndroidButtonState();
}

class _FluentAndroidButtonState extends State<FluentAndroidButton> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: widget.disabled == true
          ? FluentColors.gray.shade50
          : FluentColors.blue,
      child: InkWell(
        splashColor: FluentColors.blue[10],
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
                    : FluentColors.white,
              ),
            ),
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16)),
      ),
    );
  }
}
