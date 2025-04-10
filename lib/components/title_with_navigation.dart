import 'package:flutter/material.dart';

import 'package:homzes_mobile/utils/color_coding/color_coding.dart';
import 'package:homzes_mobile/utils/extensions/color_extension.dart';

class TitleWidget extends StatelessWidget {
  final String title;
  final double? titleWidth;
  final double titleFontSize;
  final FontWeight titleFontWeight;
  final Widget? actionWidget;
  const TitleWidget(
      {required this.title,
      this.titleWidth,
      this.actionWidget,
      required this.titleFontSize,
      required this.titleFontWeight,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: titleWidth,
          child: Text(title,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              softWrap: true,
              style: TextStyle(
                  color: cardtextColor.toColor(),
                  fontSize: titleFontSize,
                  fontWeight: titleFontWeight)),
        ),
        actionWidget!,
      ],
    );
  }
}
