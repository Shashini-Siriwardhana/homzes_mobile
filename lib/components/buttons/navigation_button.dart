import 'package:flutter/material.dart';

import 'package:homzes_mobile/utils/extensions/color_extension.dart';

class NavigationButton extends StatelessWidget {
  final double? width;
  final double? height;
  final String name;
  final double fontSize;
  final String backgroundColor;
  final double? borderRadius;
  final Function() onPressed;
  final String? onSurfaceColor;
  final String? fontColor;
  const NavigationButton(
      {this.width,
      this.height,
      required this.name,
      required this.fontSize,
      required this.backgroundColor,
      this.borderRadius = 0,
      required this.onPressed,
      this.onSurfaceColor,
      this.fontColor = "#FFFFFF",
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        child: Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 13),
              child: Text(
                name,
                style: TextStyle(
                    fontFamily: 'Roboto Flex',
                    fontSize: fontSize,
                    letterSpacing: -0.01 * fontSize,
                    fontWeight: FontWeight.w600,
                    color: fontColor!.toColor()),
              ),
            )),
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor.toColor(),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius!),
            )),
      ),
    );
  }
}
