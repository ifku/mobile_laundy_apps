import 'package:flutter/material.dart';

class CustomButton {
  String label = "Label";
  void Function()? onPressed;

  double buttonHeight = 50;
  double sizedBoxHeight = 0;

  CustomButton setLabel(String label) {
    this.label = label;
    return this;
  }

  CustomButton setOnPressed(void Function()? onPressed) {
    this.onPressed = onPressed;
    return this;
  }

  CustomButton setSizedBoxHeight(double sizedBoxHeight){
    this.sizedBoxHeight = sizedBoxHeight;
    return this;
  }

  CustomButton setButtonHeight(double buttonHeight){
    this.buttonHeight = buttonHeight;
    return this;
  }

  Widget build(BuildContext context) {
    return SizedBox(
      height: buttonHeight,
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
