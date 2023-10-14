import 'package:flutter/material.dart';

class CustomButton {
  String _label = "Label";
  void Function()? _onPressed;

  double _buttonHeight = 50;
  double _sizedBoxHeight = 0;

  CustomButton setLabel(String label) {
    _label = label;
    return this;
  }

  CustomButton setOnPressed(void Function()? onPressed) {
    _onPressed = onPressed;
    return this;
  }

  CustomButton setSizedBoxHeight(double sizedBoxHeight){
    _sizedBoxHeight = sizedBoxHeight;
    return this;
  }

  CustomButton setButtonHeight(double buttonHeight){
    _buttonHeight = buttonHeight;
    return this;
  }

  Widget build(BuildContext context) {
    return SizedBox(
      height: _buttonHeight,
      child: ElevatedButton(
        onPressed: _onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).colorScheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text(_label,
            style: const TextStyle(
                fontFamily: "Inter",
                fontSize: 14,
                fontWeight: FontWeight.w700)),
      ),
    );
  }
}
