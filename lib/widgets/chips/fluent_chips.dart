import 'package:fluent/design_system/colors.dart';
import 'package:fluent/design_system/fluent_icons_outlined.dart';
import 'package:fluent/design_system/typography.dart';
import 'package:fluent/widgets/fluent_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FluentChips extends StatefulWidget {
  final FluentAvatar persona;
  final String text;

  bool disabled, focused, error;
  final Function onPressed;
  FluentChips({
    Key key,
    @required this.persona,
    @required this.text,
    this.disabled,
    this.focused = false,
    this.error = false,
    @required this.onPressed,
  }) : super(key: key);

  @override
  _FluentChipsState createState() => _FluentChipsState();
}

class _FluentChipsState extends State<FluentChips> {
  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Material(
          color: widget.disabled == true
              ? FluentColors.gray.shade50
              : (widget.error == true && widget.focused == true)
                  ? FluentColors.red
                  : widget.focused == true
                      ? FluentColors.blue
                      : widget.error == true
                          ? FluentColors.redTint.shade40
                          : FluentColors.gray.shade100,
          borderRadius: BorderRadius.circular(2),
          child: widget.focused == true
              ? focusedState()
              : widget.error == true
                  ? errorState()
                  : defaultState()),
    );
  }

  Widget defaultState() {
    return InkWell(
      onLongPress: widget.disabled != true
          ? () {
              setState(() {
                widget.focused = true;
              });
            }
          : false,
      onTap: widget.disabled != true ? widget.onPressed : null,
      child: Container(
        constraints: BoxConstraints(
          maxHeight: 32,
          minWidth: 83,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2),
        ),
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 4, horizontal: 6),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Opacity(
                  child: widget.persona,
                  opacity: widget.disabled == true ? 0.6 : 1),
              Text(
                widget.text,
                style: FluentTextStyle.body1,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget errorState() {
    return InkWell(
      onLongPress: widget.disabled != false
          ? () {
              setState(() {
                widget.focused = true;
              });
            }
          : null,
      onTap: widget.disabled != true ? widget.onPressed : null,
      child: Container(
        constraints: BoxConstraints(
          maxHeight: 32,
          minWidth: 83,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2),
        ),
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 4, horizontal: 6),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Opacity(
                  child: widget.persona,
                  opacity: widget.disabled == true ? 0.6 : 1),
              Text(
                widget.text,
                style:
                    FluentTextStyle.body1.copyWith(color: FluentColors.red[10]),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget focusedState() {
    return InkWell(
      onLongPress: widget.disabled != true
          ? () {
              setState(() {
                widget.focused = true;
              });
            }
          : null,
      onTap: widget.disabled != true ? widget.onPressed : null,
      child: Container(
        constraints: BoxConstraints(
          maxHeight: 32,
          minWidth: 83,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2),
        ),
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 4, horizontal: 6),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                child: Icon(FluentIconsOutlined.android_dismiss_outline,
                    size: 20, color: FluentColors.white),
                onTap: () => setState(() => widget.focused = false),
              ),
              SizedBox(width: widget.focused ? 6 : 0),
              Text(
                widget.text,
                style: FluentTextStyle.body1.copyWith(
                    color: widget.focused == true
                        ? FluentColors.white
                        : FluentColors.gray.shade900),
              )
            ],
          ),
        ),
      ),
    );
  }
}
