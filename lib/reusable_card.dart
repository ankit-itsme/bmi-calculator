import 'package:flutter/material.dart';

class ReusabelCard extends StatelessWidget {
  const ReusabelCard(
      {this.onPress, required this.color, required this.cardChild});

  final Color color;
  final void Function()? onPress;
  final Widget cardChild;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Card(
        margin: EdgeInsets.all(15.0),
        child: cardChild,
        color: color,
        elevation: 6,
      ),
    );
  }
}
