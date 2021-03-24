import 'package:fluent/design_system/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  List<BottomNavBarItem> items = [];
  Color color;
  BottomNavBar({@required this.items, this.color = FluentColors.white});
  @override
  Widget build(BuildContext context) {
    return Container(
        color: color,
        height: 49,
        alignment: Alignment.center,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: items,
        ));
  }
}

class BottomNavBarItem extends StatelessWidget {
  IconData icon;
  Function onPressed;
  FluentColor iconColor;
  FluentTintColor splashColor;
  BottomNavBarItem(
      {@required this.icon,
      @required this.onPressed,
      this.iconColor = FluentColors.blue,
      this.splashColor = FluentColors.blueTint});
  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: IconButton(
        icon: Icon(
          icon,
          color: iconColor,
        ),
        onPressed: onPressed,
        splashRadius: 49 / 2,
        splashColor: splashColor,
      ),
    );
  }
}
