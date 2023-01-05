import 'package:flutter/material.dart';
import 'reusable_card.dart';
import 'constants.dart';

class BottomText extends StatelessWidget {
  const BottomText({required this.instruction, required this.onPress});
  final String instruction;
  final void Function()? onPress;

  @override
  Widget build(BuildContext context) {
    return ReusabelCard(
      onPress: onPress,
      color: Colors.pink,
      cardChild: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Text(
          instruction ,
          style: kBottomTextStyle,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
