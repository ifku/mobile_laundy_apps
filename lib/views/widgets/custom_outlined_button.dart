import 'package:flutter/material.dart';
import 'package:mobile_laundy_apps/utils/get_screen_size.dart';

class CustomOutlinedButton {
  String _label = "Label";

  double _sizedBoxHeight = 0;
  double _fontSize = 12;

  void Function()? _onPressed;

  CustomOutlinedButton setLabel(String label) {
    _label = label;
    return this;
  }

  CustomOutlinedButton setSizedBoxHeight(double sizedBoxHeight) {
    _sizedBoxHeight = sizedBoxHeight;
    return this;
  }

  CustomOutlinedButton setFontSize(double fontSize) {
    _fontSize = fontSize;
    return this;
  }

  CustomOutlinedButton setOnPressed(void Function()? onPressed) {
    _onPressed = onPressed;
    return this;
  }

  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: GetScreenSize.getScreenWidth(context),
          height: 50,
          child: OutlinedButton(
            onPressed: _onPressed,
            style: OutlinedButton.styleFrom(
              primary: Colors.black,
              side: BorderSide(
                  color:
                      Theme.of(context).colorScheme.primary.withOpacity(0.5)),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            ),
            child: Text(_label,
                style: TextStyle(
                    fontSize: _fontSize,
                    fontFamily: "Inter",
                    color: Theme.of(context)
                        .colorScheme
                        .onBackground
                        .withOpacity(0.5))),
          ),
        ),
        SizedBox(height: _sizedBoxHeight)
      ],
    );
  }
}
