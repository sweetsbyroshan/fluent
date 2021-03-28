import 'package:fluent/design_system/colors.dart';
import 'package:fluent/design_system/elevation.dart';
import 'package:fluent/design_system/fluent_icons_outlined.dart';
import 'package:fluent/design_system/typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../fluent_avatar.dart';

class FluentNavBar extends PreferredSize {
  final Widget avatar, leftIcon;
  final String title;
  final TextStyle titleStyle;
  final List<Widget> actions;
  final bool isMenuOnly;
  final FluentNavbarStyle style;
  FluentNavBar({
    @required this.title,
    this.avatar,
    @required this.style,
    this.leftIcon,
    this.titleStyle,
    this.actions,
    this.isMenuOnly = false,
  }) : assert(leftIcon == null || avatar == null);

  @override
  Widget build(BuildContext context) {
    return style == FluentNavbarStyle.Default
        ? PhysicalModel(
            child: Container(
              margin: EdgeInsets.only(top: 30, left: 16, right: 16, bottom: 10),
              constraints: BoxConstraints(
                maxHeight: preferredSize.height,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        avatar ?? Container(),
                        leftIcon ?? Container(),
                        SizedBox(
                          width: avatar == null || leftIcon == null
                              ? 0
                              : 24, //add fa check
                        ),
                        SizedBox(
                          width: avatar == null || leftIcon == null
                              ? 0
                              : 24, //add fa check
                        ),
                        SizedBox(
                          width: leftIcon == null ? 0 : 24, //add fa check
                        ),
                      ],
                    ),
                  ),
                  Flexible(
                      child: Text(
                    title ?? '',
                    style: titleStyle ??
                        FluentTextStyle.title1.copyWith(
                          color: FluentColors.white,
                        ),
                    textAlign: TextAlign.center,
                  )),
                  Flexible(
                      child: actions != null
                          ? isMenuOnly == true
                              ? ListView.builder(
                                  itemBuilder: (context, i) {
                                    if (i == 3)
                                      return IconButton(
                                          icon: Icon(
                                            FluentIconsOutlined
                                                .android_more_vertical_outline,
                                            color: FluentColors.white,
                                          ),
                                          onPressed: () {});
                                    else
                                      return actions[i];
                                  },
                                  shrinkWrap: true,
                                  itemCount:
                                      actions.length >= 4 ? 4 : actions.length,
                                  scrollDirection: Axis.horizontal)
                              : IconButton(
                                  icon: Icon(
                                    FluentIconsOutlined
                                        .android_more_vertical_outline,
                                    color: FluentColors.white,
                                  ),
                                  onPressed: () {})
                          : Container()),
                ],
              ),
            ),
            color: FluentColors.blue,
            shadowColor: FluentColors.black.withAlpha(100),
            elevation: Elevation.ELEVATION_SIX)
        : PhysicalModel(
            child: Container(
              margin: EdgeInsets.only(top: 30, left: 16, right: 16, bottom: 10),
              constraints: BoxConstraints(
                maxHeight: preferredSize.height,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        avatar ?? Container(),
                        leftIcon ?? Container(),
                        SizedBox(
                          width: avatar == null || leftIcon == null
                              ? 0
                              : 24, //add fa check
                        ),
                        SizedBox(
                          width: avatar == null || leftIcon == null
                              ? 0
                              : 24, //add fa check
                        ),
                        SizedBox(
                          width: leftIcon == null ? 0 : 24, //add fa check
                        ),
                        Text(
                          title ?? '',
                          style: titleStyle ??
                              FluentTextStyle.title1IOS.copyWith(
                                color: FluentColors.white,
                              ),
                        )
                      ],
                    ),
                  ),
                  Flexible(
                      child: actions != null
                          ? isMenuOnly == true
                              ? ListView.builder(
                                  itemBuilder: (context, i) {
                                    if (i == 3)
                                      return IconButton(
                                          icon: Icon(
                                            FluentIconsOutlined
                                                .android_more_vertical_outline,
                                            color: FluentColors.white,
                                          ),
                                          onPressed: () {});
                                    else
                                      return actions[i];
                                  },
                                  shrinkWrap: true,
                                  itemCount:
                                      actions.length >= 4 ? 4 : actions.length,
                                  scrollDirection: Axis.horizontal)
                              : IconButton(
                                  icon: Icon(
                                    FluentIconsOutlined
                                        .android_more_vertical_outline,
                                    color: FluentColors.white,
                                  ),
                                  onPressed: () {})
                          : Container()),
                ],
              ),
            ),
            color: FluentColors.blue,
            shadowColor: FluentColors.black.withAlpha(100),
            elevation: Elevation.ELEVATION_SIX);
  }

  @override
  final Size preferredSize = Size.fromHeight(60);
}

enum FluentNavbarStyle { Default, Shy }
