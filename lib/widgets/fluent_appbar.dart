import 'package:fluent/design_system/colors.dart';
import 'package:fluent/design_system/elevation.dart';
import 'package:fluent/design_system/typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'fluent_avatar.dart';

class FluentAppBar extends PreferredSize {
  final Widget avatar, leftIcon;
  final String title, subtitle;
  final TextStyle titleStyle;
  final List<Widget> actions, overflow;
  FluentAppBar(
      {@required this.title,
      this.subtitle,
      this.avatar,
      this.leftIcon,
      this.titleStyle,
      this.actions,
      this.overflow})
      : assert(leftIcon == null || avatar == null),
        assert(
            (actions != null ? actions.length <= 3 : true) || overflow == null);

  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
        child: Container(
          margin: EdgeInsets.only(top: 30, left: 16, right: 16, bottom: 10),
          constraints: BoxConstraints(
            maxHeight: preferredSize.height,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              FluentAvatar(),
              SizedBox(
                width: 24, //add fa check
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title ?? '',
                    style: titleStyle ??
                        FluentTextStyle.title1
                            .copyWith(color: FluentColors.white),
                  ),
                  Text(
                    subtitle ?? '',
                    style: titleStyle ??
                        FluentTextStyle.subheading1
                            .copyWith(color: FluentColors.white),
                  ),
                ],
              ),
            ],
          ),
        ),
        color: FluentColors.blue,
        shadowColor: FluentColors.black.withAlpha(100),
        elevation: Elevation.ELEVATION_SIX);
  }

  @override
  final Size preferredSize = Size.fromHeight(80);
}
