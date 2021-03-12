import 'package:fluent/design_system/colors.dart';
import 'package:fluent/widgets/tooltip/fluent_tooltip.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ToolTipPainter extends CustomPainter {
  FluentToolType type;
  ToolTipPainter({@required this.type});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = FluentColors.gray.shade900
      ..strokeWidth = 10
      ..style = PaintingStyle.fill;

    canvas.drawPath(
        type == FluentToolType.Top
            ? getTop(size.width, size.height)
            : getBottom(size.width, size.height),
        paint);
  }

  Path getBottom(double x, double y) {
    // return Path()
    //   ..moveTo(x + 7.70711, y + 6.29289)
    //   ..addArc(
    //       Rect.fromLTRB(x + 7.31658, y + 6.68342, x + 6.68342, y + 6.68342),
    //       x + 6.29289,
    //       y + 6.29289)
    //   ..lineTo(0, 0)
    //   ..lineTo(x + 14, 0)
    //   ..lineTo(x + 7.70711, y + 6.29289)
    //   ..close();

    return Path()
      ..moveTo(0, 0)
      ..lineTo(x / 2, y)
      ..lineTo(x, 0)
      ..lineTo(0, 0)
      ..close();
  }

  Path getTop(double x, double y) {
    return Path()
      ..moveTo(0, y)
      ..lineTo(x / 2, 0)
      ..lineTo(x, y)
      ..lineTo(0, y)
      ..close();
  }

  @override
  bool shouldRepaint(ToolTipPainter oldDelegate) {
    return oldDelegate.type != type;
  }
}
