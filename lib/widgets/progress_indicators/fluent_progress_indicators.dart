import 'package:fluent/design_system/colors.dart';
import 'package:fluent/design_system/fluent_size.dart';
import 'package:fluent/design_system/typography.dart';
import 'package:flutter/material.dart';

class FluentCircularProgressIndicator extends StatelessWidget {
  FluentSize size;
  IndicatorType indicatorType;
  String label;
  FluentCircularProgressIndicator(
      {this.size = FluentSize.MEDIUM, @required this.indicatorType, this.label})
      : assert(indicatorType == IndicatorType.HUD && label != null);
  @override
  Widget build(BuildContext context) {
    return indicatorType == IndicatorType.Linear
        ? LinearProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(FluentColors.blue),
            backgroundColor: FluentColors.gray.shade100,
            minHeight: 2,
          )
        : indicatorType == IndicatorType.Circular
            ? SizedBox(
                height: size == FluentSize.XSMALL
                    ? 18
                    : size == FluentSize.SMALL
                        ? 28
                        : size == FluentSize.MEDIUM
                            ? 36
                            : 44,
                width: size == FluentSize.XSMALL
                    ? 18
                    : size == FluentSize.SMALL
                        ? 28
                        : size == FluentSize.MEDIUM
                            ? 36
                            : 44,
                child: CircularProgressIndicator(
                    backgroundColor: FluentColors.gray.shade100,
                    valueColor:
                        AlwaysStoppedAnimation<Color>(FluentColors.blue),
                    strokeWidth: size == FluentSize.XSMALL
                        ? 2
                        : size == FluentSize.SMALL
                            ? 3
                            : 4),
              )
            : Container(
                padding:
                    label.length > 0 ? EdgeInsets.all(15) : EdgeInsets.all(30),
                child: Column(
                  children: [
                    SizedBox(
                      height: 36,
                      width: 36,
                      child: CircularProgressIndicator(
                          valueColor:
                              AlwaysStoppedAnimation<Color>(FluentColors.white),
                          strokeWidth: 4),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Flexible(
                      child: Text(label,
                          style: FluentTextStyle.body
                              .copyWith(color: Colors.white)),
                    )
                  ],
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: FluentColors.gray.shade800),
                height: 108,
                width: 108,
              );
  }
}

enum IndicatorType { Linear, Circular, HUD }
