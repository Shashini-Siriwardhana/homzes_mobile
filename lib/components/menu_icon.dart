import 'package:flutter/material.dart';

import 'package:homzes_mobile/utils/extensions/color_extension.dart';

class MenuIcon extends StatelessWidget {
  final String borderColor;
  final String iconColor;
  final String backgroundColor;

  const MenuIcon(
      {required this.borderColor,
      required this.iconColor,
      required this.backgroundColor,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: BoxDecoration(
          color: backgroundColor.toColor(),
          shape: BoxShape.circle,
          border: Border.all(width: 1, color: borderColor.toColor())),
      child: IconButton(
          onPressed: (() {}),
          icon: Icon(
            Icons.menu_rounded,
            color: iconColor.toColor(),
          )),
    );
  }
}
