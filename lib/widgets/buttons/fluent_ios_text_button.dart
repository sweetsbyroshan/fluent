import 'package:fluent/design_system/colors.dart';
import 'package:fluent/design_system/typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FluentIosTextButton extends StatefulWidget {
  final String text;
  FluentIosTextButton({
    @required this.text,
    @required this.onPressed,
    this.disabled = false,
  });
  final bool disabled;
  final Function onPressed;
  @override
  _FluentIosTextButtonState createState() => _FluentIosTextButtonState();
}

class _FluentIosTextButtonState extends State<FluentIosTextButton> {
  bool focused = false;
  @override
  Widget build(BuildContext context) {
    return Material(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
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
            constraints: BoxConstraints(maxHeight: 52, minWidth: 91),
            child: Text(
              widget.text,
              textAlign: TextAlign.center,
              style: FluentTextStyle.button1.copyWith(
                  textBaseline: TextBaseline.ideographic,
                  color: widget.disabled == true
                      ? FluentColors.gray.shade300
                      : focused == false
                          ? FluentColors.blue
                          : FluentColors.blueTint.shade20),
            ),
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 8)),
      ),
    );
  }
}
