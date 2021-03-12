import 'package:fluent/design_system/colors.dart';
import 'package:fluent/design_system/typography.dart';
import 'package:flutter/widgets.dart';

import 'tooltip_painter.dart';

class FluentToolTip extends StatelessWidget {
  FluentToolType type;
  String text;
  FluentToolTip({@required this.type, @required this.text});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: type == FluentToolType.Top
          ? CrossAxisAlignment.end
          : CrossAxisAlignment.start,
      children: [
        Visibility(
          visible: type == FluentToolType.Top,
          child: Padding(
              padding: EdgeInsets.only(left: 28.0, right: 28.0, top: 20),
              child: CustomPaint(
                painter: ToolTipPainter(type: FluentToolType.Top),
                size: Size(14, 7),
              )),
        ),
        Container(
          constraints: BoxConstraints(minHeight: 28, maxWidth: 168),
          padding: EdgeInsets.all(10),
          child: Text(text,
              style: FluentTextStyle.body1.copyWith(
                color: FluentColors.white,
              )),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: FluentColors.gray.shade950),
        ),
        Visibility(
          visible: type == FluentToolType.Bottom,
          child: Padding(
              padding: EdgeInsets.only(left: 28.0, right: 28.0, bottom: 20),
              child: CustomPaint(
                painter: ToolTipPainter(type: FluentToolType.Bottom),
                size: Size(14, 7),
              )),
        ),
      ],
    );
  }
}

enum FluentToolType { Top, Bottom }
