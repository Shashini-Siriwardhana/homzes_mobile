import 'package:flutter/material.dart';

import 'package:homzes_mobile/utils/extensions/color_extension.dart';

import '../utils/color_coding/color_coding.dart';

class ProfileIcon extends StatelessWidget {
  final String user;
  final String statusColor;

  const ProfileIcon({required this.user, required this.statusColor, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Ink(
          decoration: BoxDecoration(
            color: profileIconColor.toColor(),
            shape: BoxShape.circle,
          ),
          child: IconButton(
              onPressed: (() {}),
              icon: Text(
                user,
                style: TextStyle(
                    color: cardtextColor.toColor(),
                    fontWeight: FontWeight.w600,
                    fontSize: 16),
              )),
        ),
        Positioned(
          top: 1,
          right: 1,
          child: Container(
            width: 12,
            height: 12,
            decoration: BoxDecoration(
              color: statusColor.toColor(),
              shape: BoxShape.circle,
            ),
          ),
        ),
      ],
    );
  }
}
