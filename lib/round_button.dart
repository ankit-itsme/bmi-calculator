import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  const RoundButton({required this.onPressed, required this.icon});
  final void Function()? onPressed;
  final icon;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      elevation: 6,
      child: Icon(
        icon,
        size: 30,
        color: Colors.white,
      ),
      fillColor: Colors.white12,
      constraints: BoxConstraints(minWidth: 36.0, minHeight: 36.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}

