import 'package:fluent/design_system/colors.dart';
import 'package:fluent/design_system/typography.dart';
import 'package:fluent/widgets/fluent_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FluentChips extends StatelessWidget {
  final FluentAvatar persona;
  final String text;

  final bool disabled;
  final Function onPressed;
  const FluentChips({
    Key key,
    this.persona,
    this.text,
    this.disabled,
    this.onPressed,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Material(
        color: disabled == true
            ? FluentColors.gray.shade50
            : FluentColors.gray.shade100,
        borderRadius: BorderRadius.circular(8),
        child: InkWell(
          onTap: () {},
          child: Container(
            constraints: BoxConstraints(
              maxHeight: 32,
              minWidth: 83,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
            ),
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 4, horizontal: 6),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FluentAvatar(),
                  Text(
                    'Default',
                    style: FluentTextStyle.body1.copyWith(
                        color: disabled == true
                            ? FluentColors.gray.shade400
                            : FluentColors.gray.shade900),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// types
// default
// focused
// error
// error focused
