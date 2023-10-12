import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InputField {
  TextEditingController? controller;
  String label = "Label";
  double labelFontSize = 15;
  double labelSpacing = 10;

  InputField setController(TextEditingController controller) {
    this.controller = controller;
    return this;
  }

  InputField setLabel(String label) {
    this.label = label;
    return this;
  }

  InputField setLabelFontSize(double fontSize) {
    this.labelFontSize = fontSize;
    return this;
  }

  InputField setLabelSpacing(double spacing) {
    this.labelSpacing = spacing;
    return this;
  }

  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: labelFontSize),
        ),
        SizedBox(
          height: labelSpacing,
        ),
        TextField(
          controller: controller,
          decoration: const InputDecoration(
            border: InputBorder.none,
            fillColor: Color(0xfff3f3f4),
            filled: true,
          ),
        ),
      ],
    );
  }
}