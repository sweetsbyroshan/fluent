import 'package:fluent/design_system/colors.dart';
import 'package:fluent/design_system/elevation.dart';
import 'package:fluent/design_system/fluent_icons_outlined.dart';
import 'package:fluent/design_system/typography.dart';
import 'package:fluent/widgets/navbar/fluent_navbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FluentSearchNavBar extends PreferredSize {
  final Widget avatar, leftIcon;
  final List<Widget> actions;
  final bool isMenuOnly;
  final FluentNavbarStyle style;
  final Widget preffixIcon, suffixIcon, accountSwitcher;
  final String searchLabel, title;
  final TextStyle titleStyle, searchLabelStyle;
  static bool _withTitle;
  FluentSearchNavBar({
    this.avatar,
    this.leftIcon,
    this.actions,
    this.isMenuOnly,
    this.style,
    @required this.searchLabel,
    this.preffixIcon,
    this.suffixIcon,
    this.accountSwitcher,
    this.title,
    this.titleStyle,
    this.searchLabelStyle,
  }) : assert(title == null || accountSwitcher == null) {
    _withTitle = title != null;
  }

  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
        child: Container(
          margin: EdgeInsets.only(top: 30, left: 16, right: 16, bottom: 10),
          width: double.maxFinite,
          constraints: BoxConstraints(
            maxHeight: preferredSize.height,
          ),
          child: title != null
              ? Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    style == FluentNavbarStyle.Default
                        ? Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              avatar == null && leftIcon == null
                                  ? Container()
                                  : Flexible(
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          avatar ?? Container(),
                                          leftIcon ?? Container(),
                                          SizedBox(
                                            width: avatar == null ||
                                                    leftIcon == null
                                                ? 0
                                                : 24, //add fa check
                                          ),
                                          SizedBox(
                                            width: avatar == null ||
                                                    leftIcon == null
                                                ? 0
                                                : 24, //add fa check
                                          ),
                                          SizedBox(
                                            width: leftIcon == null
                                                ? 0
                                                : 24, //add fa check
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
                              actions != null
                                  ? Flexible(
                                      child: actions != null
                                          ? isMenuOnly == true
                                              ? ListView.builder(
                                                  itemBuilder: (context, i) {
                                                    if (i == 3)
                                                      return IconButton(
                                                          icon: Icon(
                                                            FluentIconsOutlined
                                                                .android_more_vertical_outline,
                                                            color: FluentColors
                                                                .white,
                                                          ),
                                                          onPressed: () {});
                                                    else
                                                      return actions[i];
                                                  },
                                                  shrinkWrap: true,
                                                  itemCount: actions.length >= 4
                                                      ? 4
                                                      : actions.length,
                                                  scrollDirection:
                                                      Axis.horizontal)
                                              : IconButton(
                                                  icon: Icon(
                                                    FluentIconsOutlined
                                                        .android_more_vertical_outline,
                                                    color: FluentColors.white,
                                                  ),
                                                  onPressed: () {})
                                          : Container())
                                  : Container()
                            ],
                          )
                        : Row(
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
                                      width: leftIcon == null
                                          ? 0
                                          : 24, //add fa check
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
                                                        color:
                                                            FluentColors.white,
                                                      ),
                                                      onPressed: () {});
                                                else
                                                  return actions[i];
                                              },
                                              shrinkWrap: true,
                                              itemCount: actions.length >= 4
                                                  ? 4
                                                  : actions.length,
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
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: FluentColors.black.withAlpha(51),
                          borderRadius: BorderRadius.circular(4)),
                      height: 40,
                      alignment: Alignment.center,
                      child: TextFormField(
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 4),
                              prefixIcon: preffixIcon != null
                                  ? Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 16, vertical: 12),
                                      child: preffixIcon,
                                    )
                                  : null,
                              suffixIcon: suffixIcon != null
                                  ? Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 16, vertical: 12),
                                      child: preffixIcon,
                                    )
                                  : null,
                              border: InputBorder.none,
                              alignLabelWithHint: true,
                              hintText: searchLabel,
                              hintStyle: searchLabelStyle ??
                                  FluentTextStyle.subheading1
                                      .copyWith(color: FluentColors.white))),
                    )
                  ],
                )
              : Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(
                      flex: 6,
                      fit: FlexFit.tight,
                      child: Container(
                        decoration: BoxDecoration(
                            color: FluentColors.black.withAlpha(51),
                            borderRadius: BorderRadius.circular(4)),
                        height: 40,
                        child: TextFormField(
                            decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 4),
                                prefixIcon:
                                    preffixIcon != null ? preffixIcon : null,
                                suffixIcon:
                                    suffixIcon != null ? suffixIcon : null,
                                border: InputBorder.none,
                                labelText: searchLabel,
                                labelStyle: searchLabelStyle ??
                                    FluentTextStyle.subheading1
                                        .copyWith(color: FluentColors.white))),
                      ),
                    ),
                    Flexible(
                        flex: 1,
                        fit: FlexFit.tight,
                        child: Padding(
                            padding: EdgeInsets.only(left: 18),
                            child: Row(
                              children: [
                                Flexible(flex: 2, child: accountSwitcher),
                                SizedBox(
                                  width: 5,
                                ),
                                Flexible(
                                  flex: 1,
                                  child: Icon(
                                    FluentIconsOutlined
                                        .ios_chevron_down_outline,
                                    size: 15,
                                    color: FluentColors.white,
                                  ),
                                )
                              ], //add a down chevron
                            )))
                  ],
                ),
        ),
        color: FluentColors.blue,
        shadowColor: FluentColors.black.withAlpha(100),
        elevation: Elevation.ELEVATION_SIX);
  }

  @override
  final Size preferredSize =
      _withTitle ?? true ? Size.fromHeight(120) : Size.fromHeight(80);
}
