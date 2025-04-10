import 'package:flutter/material.dart';

import 'package:homzes_mobile/utils/color_coding/color_coding.dart';
import 'package:homzes_mobile/utils/extensions/color_extension.dart';

class ProertyDetailContainer extends StatelessWidget {
  final String text;
  const ProertyDetailContainer({required this.text, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: menuIconColor.toColor()),
      child: Padding(
        padding: const EdgeInsets.only(top: 4, right: 10, bottom: 3, left: 10),
        child: Text(text),
      ),
    );
  }
}
