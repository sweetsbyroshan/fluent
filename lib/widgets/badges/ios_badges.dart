import 'package:fluent/design_system/colors.dart';
import 'package:fluent/design_system/typography.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Badge extends StatefulWidget {
  BadgeType type;
  BadgeSize size;
  String label;
  Function onTap;
  Badge(
      {Key key,
      this.type,
      this.size,
      @required this.onTap,
      @required this.label})
      : super(key: key);

  @override
  _BadgeState createState() => _BadgeState();
}

class _BadgeState extends State<Badge> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return widget.type == BadgeType.Default
        ? InkWell(
            onTap: () {
              setState(() {
                isSelected = !isSelected;
              });
              widget.onTap();
            },
            child: FittedBox(
              child: Container(
                padding: EdgeInsets.all(5),
                alignment: Alignment.center,
                constraints: widget.size == BadgeSize.Medium
                    ? BoxConstraints(minHeight: 26)
                    : BoxConstraints(minHeight: 20),
                child: Text(
                  widget.label,
                  style: widget.size == BadgeSize.Medium
                      ? FluentTextStyle.subhead.copyWith(
                          color: isSelected != true
                              ? FluentColors.blue
                              : FluentColors.white)
                      : FluentTextStyle.footnote.copyWith(
                          color: isSelected != true
                              ? FluentColors.blue
                              : FluentColors.white),
                ),
                decoration: BoxDecoration(
                    color: isSelected != true
                        ? FluentColors.blueTint.shade40
                        : FluentColors.blue,
                    borderRadius: BorderRadius.circular(3)),
              ),
            ),
          )
        : widget.type == BadgeType.Warning
            ? InkWell(
                onTap: () {
                  setState(() {
                    isSelected = !isSelected;
                  });
                  widget.onTap();
                },
                child: FittedBox(
                  child: Container(
                    padding: EdgeInsets.all(5),
                    alignment: Alignment.center,
                    constraints: widget.size == BadgeSize.Medium
                        ? BoxConstraints(minHeight: 26)
                        : BoxConstraints(minHeight: 20),
                    child: Text(
                      widget.label,
                      style: widget.size == BadgeSize.Medium
                          ? FluentTextStyle.subhead
                              .copyWith(color: FluentColors.yellow[30])
                          : FluentTextStyle.footnote
                              .copyWith(color: FluentColors.yellow[30]),
                    ),
                    decoration: BoxDecoration(
                        color: isSelected != true
                            ? FluentColors.yellowTint.shade40
                            : FluentColors.yellow,
                        borderRadius: BorderRadius.circular(3)),
                  ),
                ),
              )
            : widget.type == BadgeType.Error
                ? InkWell(
                    onTap: () {
                      setState(() {
                        isSelected = !isSelected;
                      });
                      widget.onTap();
                    },
                    child: FittedBox(
                      child: Container(
                        padding: EdgeInsets.all(5),
                        alignment: Alignment.center,
                        constraints: widget.size == BadgeSize.Medium
                            ? BoxConstraints(minHeight: 26)
                            : BoxConstraints(minHeight: 20),
                        child: Text(
                          widget.label,
                          style: widget.size == BadgeSize.Medium
                              ? FluentTextStyle.subhead.copyWith(
                                  color: isSelected != true
                                      ? FluentColors.red[10]
                                      : FluentColors.white)
                              : FluentTextStyle.footnote.copyWith(
                                  color: isSelected != true
                                      ? FluentColors.red[10]
                                      : FluentColors.white),
                        ),
                        decoration: BoxDecoration(
                            color: isSelected != true
                                ? FluentColors.redTint.shade40
                                : FluentColors.red,
                            borderRadius: BorderRadius.circular(3)),
                      ),
                    ),
                  )
                : InkWell(
                    onTap: null,
                    child: FittedBox(
                      child: Container(
                        padding: EdgeInsets.all(5),
                        alignment: Alignment.center,
                        constraints: widget.size == BadgeSize.Medium
                            ? BoxConstraints(minHeight: 26)
                            : BoxConstraints(minHeight: 20),
                        child: Text(widget.label,
                            style: widget.size == BadgeSize.Medium
                                ? FluentTextStyle.subhead.copyWith(
                                    color: FluentColors.gray,
                                  )
                                : FluentTextStyle.footnote.copyWith(
                                    color: FluentColors.gray,
                                  )),
                        decoration: BoxDecoration(
                            color: FluentColors.gray.shade25,
                            borderRadius: BorderRadius.circular(3)),
                      ),
                    ),
                  );
  }
}

enum BadgeType { Default, Error, Warning }

enum BadgeSize { Medium, Small }
