import 'package:fluent/design_system/colors.dart';
import 'package:fluent/design_system/typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FluentIosOutlinedButton extends StatefulWidget {
  final String text;
  FluentIosOutlinedButton({
    @required this.text,
    @required this.onPressed,
    this.disabled = false,
    this.tertiary = false,
  });
  final bool disabled, tertiary;
  final Function onPressed;
  @override
  _FluentIosOutlinedButtonState createState() =>
      _FluentIosOutlinedButtonState();
}

class _FluentIosOutlinedButtonState extends State<FluentIosOutlinedButton> {
  bool focused = false;
  @override
  Widget build(BuildContext context) {
    return Material(
      shape: RoundedRectangleBorder(
          borderRadius: widget.tertiary == true
              ? BorderRadius.circular(5)
              : BorderRadius.circular(8),
          side: BorderSide(
              color: widget.disabled == true
                  ? FluentColors.gray.shade300
                  : focused == false
                      ? FluentColors.blueTint.shade20
                      : FluentColors.blueTint.shade30,
              width: 1)),
      child: InkWell(
        splashColor: FluentColors.transparent,
        highlightColor: FluentColors.transparent,
        onHighlightChanged: (focus) {
          setState(() => focused = focus);
          print(focused);
        },
        onTap: widget.disabled == true ? null : widget.onPressed,
        child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
            ),
            constraints: widget.tertiary == true
                ? BoxConstraints(maxHeight: 28, minWidth: 71)
                : BoxConstraints(maxHeight: 52, minWidth: 91),
            child: Text(
              widget.text,
              textAlign: TextAlign.center,
              style: FluentTextStyle.button2.copyWith(
                  textBaseline: TextBaseline.ideographic,
                  color: widget.disabled == true
                      ? FluentColors.gray.shade300
                      : focused == false
                          ? FluentColors.blue
                          : FluentColors.blueTint.shade20),
            ),
            padding: widget.tertiary == true
                ? EdgeInsets.symmetric(vertical: 8, horizontal: 8)
                : EdgeInsets.symmetric(vertical: 10, horizontal: 16)),
      ),
    );
  }
}
