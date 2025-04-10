import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:homzes_mobile/utils/color_coding/color_coding.dart';
import 'package:homzes_mobile/utils/extensions/color_extension.dart';

class IconCard extends StatelessWidget {
  final String name;
  final String icon;
  final String backgroundColor;
  const IconCard(
      {required this.name,
      required this.icon,
      required this.backgroundColor,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      height: 172,
      decoration: BoxDecoration(
          color: backgroundColor.toColor(),
          borderRadius: BorderRadius.circular(24)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Align(
                alignment: Alignment.topLeft,
                child: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                      color: menuIconColor.toColor(), shape: BoxShape.circle),
                  child: icon != ''
                      ? Center(
                          child: SvgPicture.asset(
                            icon,
                          ),
                        )
                      : Container(),
                ),
              ),
            ),
            Text(
              name,
              style: TextStyle(
                  color: cardtextColor.toColor(),
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Roboto Flex'),
            )
          ],
        ),
      ),
    );
  }
}
