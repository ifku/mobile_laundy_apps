import 'package:flutter/material.dart';

class CustomCheckboxWithText {
  String _text = "Text";
  final bool _value = false;
  void Function(bool?)? _onChanged;

  CustomCheckboxWithText setText(String text) {
    _text = text;
    return this;
  }

  CustomCheckboxWithText setOnChanged(void Function(bool?) onChanged) {
    _onChanged = onChanged;
    return this;
  }

  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Checkbox(
                value: _value,
                onChanged: _onChanged,
              ),
              Text(_text),
            ],
          ),
          InkWell(
            onTap: () {},
            child: Text("Lupa Password?",
                style: TextStyle(color: Theme.of(context).colorScheme.primary, fontWeight: FontWeight.w500)),
          ),
        ],
      ),
    );
  }
}
