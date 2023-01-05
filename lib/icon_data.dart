import 'package:flutter/material.dart';
import 'constants.dart';

class IconDataCard extends StatelessWidget {
  const IconDataCard({required this.lebel, required this.iconWidget});
  final IconData iconWidget;
  final String lebel;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          iconWidget,
          color: Colors.white,
          size: 80,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          lebel,
          style: kLevelTextStyle,
        ),
      ],
    );
  }
}

