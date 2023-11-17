import 'package:WashWoosh/utils/get_screen_size.dart';
import 'package:flutter/material.dart';

class CustomJoinMemberButton {
  String _label = "Label";
  void Function()? _onPressed;

  bool _isActive = true;
  double _buttonHeight = 50;
  double _sizedBoxHeight = 0;

  CustomJoinMemberButton setLabel(String label) {
    _label = label;
    return this;
  }

  CustomJoinMemberButton setOnPressed(void Function()? onPressed) {
    _onPressed = onPressed;
    return this;
  }

  CustomJoinMemberButton setSizedBoxHeight(double sizedBoxHeight){
    _sizedBoxHeight = sizedBoxHeight;
    return this;
  }

  CustomJoinMemberButton setButtonHeight(double buttonHeight){
    _buttonHeight = buttonHeight;
    return this;
  }

  CustomJoinMemberButton setIsActive(bool isActive){
    _isActive = isActive;
    return this;
  }

  Widget build(BuildContext context) {
    return SizedBox(
      height: _buttonHeight,
      width: GetScreenSize.getScreenWidth(context),
      child: ElevatedButton(
        onPressed: _isActive ? null : _onPressed,
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
