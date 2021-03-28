import 'package:fluent/design_system/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  List<BottomNavBarItem> items = [];
  Color color;
  int currentIndex = 0;
  BottomNavBar(
      {@required this.items,
      @required this.currentIndex,
      this.color = FluentColors.white})
      : assert(items.length <= 5);
  @override
  Widget build(BuildContext context) {
    items[currentIndex].activate();
    return Container(
        color: color,
        height: 49,
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width,
        child: ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          primary: false,
          itemCount: items.length > 5 ? 5 : items.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, i) => Container(
            child: items[i],
            width: MediaQuery.of(context).size.width,
            constraints: BoxConstraints(
                minWidth: MediaQuery.of(context).size.width / 15,
                maxWidth: MediaQuery.of(context).size.width / 5),
          ),
        ));
  }

  updateSelected(int i) {
    for (var item in items) {
      item._isActive = false;
    }
    items[i].activate();
  }
}

class BottomNavBarItem extends StatelessWidget {
  IconData icon;
  Function onPressed;
  FluentColor iconColor;
  FluentTintColor splashColor;
  bool _isActive = false;
  BottomNavBarItem(
      {@required this.icon,
      @required this.onPressed,
      this.iconColor = FluentColors.blue,
      this.splashColor = FluentColors.blueTint});
  @override
  Widget build(BuildContext context) {
    return Material(
      color: _isActive ? FluentColors.black : FluentColors.transparent,
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

  activate() => _isActive = true;
}
