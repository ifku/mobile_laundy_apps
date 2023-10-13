import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomButton {
  String label = "Label";
  void Function()? onPressed;

  CustomButton setLabel(String label) {
    this.label = label;
    return this;
  }

  CustomButton setOnPressed(void Function()? onPressed) {
    this.onPressed = onPressed;
    return this;
  }

  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          primary: Theme.of(context).colorScheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text(label,
            style: const TextStyle(
                fontFamily: "Inter",
                fontSize: 14,
                fontWeight: FontWeight.w700)),
      ),
    );
  }
}
