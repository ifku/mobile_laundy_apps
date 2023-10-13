import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_laundy_apps/views/widgets/CustomCheckboxWithText.dart';

class CustomCheckboxWithText {
  String text = "Text";
  final bool value = false;
  void Function(bool?)? onChanged;

  CustomCheckboxWithText setText(String text) {
    this.text = text;
    return this;
  }

  CustomCheckboxWithText setOnChanged(void Function(bool?) onChanged) {
    this.onChanged = onChanged;
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
                value: value,
                onChanged: onChanged,
              ),
              Text(text),
            ],
          ),
          TextButton(
            onPressed: () {},
            child: const Text("Lupa Password?"),
          ),
        ],
      ),
    );
  }
}
