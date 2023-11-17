import 'package:flutter/material.dart';

class CustomSwitcherWithText extends StatelessWidget {
  bool value = false;
  void Function(bool) onSwitch;

  CustomSwitcherWithText({
    super.key,
    required this.value,
    required this.onSwitch,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Sudah dibayar ?",
          style: TextStyle(
              fontFamily: "Lato",
              fontWeight: FontWeight.w500,
              color:
                  Theme.of(context).colorScheme.onBackground.withOpacity(0.4)),
        ),
        Switch(value: value, onChanged: onSwitch),
      ],
    );
  }
}
