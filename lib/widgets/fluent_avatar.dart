import 'package:fluent/design_system/colors.dart';
import 'package:fluent/design_system/fluent_size.dart';
import 'package:flutter/widgets.dart';

class FluentAvatar extends StatelessWidget {
  final FluentSize fluentSize;

  const FluentAvatar({Key key, this.fluentSize = FluentSize.MEDIUM})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: fluentSize.size.height,
      width: fluentSize.size.width,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(image: AssetImage('assets/persona.png'))),
    );
  }
}
