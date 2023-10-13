import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomInputField {
  TextEditingController? controller;
  String label = "Label";
  double labelFontSize = 15;
  bool obscureText = false;
  Icon icon = const Icon(Icons.abc);

  double sizedBoxHeight = 0;

  CustomInputField setController(TextEditingController controller) {
    this.controller = controller;
    return this;
  }

  CustomInputField setLabel(String label) {
    this.label = label;
    return this;
  }

  CustomInputField setLabelFontSize(double fontSize) {
    this.labelFontSize = fontSize;
    return this;
  }

  CustomInputField setIcon(Icon icon) {
    this.icon = icon;
    return this;
  }

  CustomInputField setObscureText(bool obscureText) {
    this.obscureText = obscureText;
    return this;
  }

  CustomInputField setSizedBoxHeight(double height) {
    this.sizedBoxHeight = height;
    return this;
  }

  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          maxLines: 1,
          controller: controller,
          obscureText: obscureText,
          decoration: InputDecoration(
              hintText: label,
              hintStyle: TextStyle(
                  fontSize: 12,
                  fontFamily: "Lato",
                  fontWeight: FontWeight.normal,
                  color: Theme.of(context)
                      .colorScheme
                      .onBackground
                      .withOpacity(0.5)),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
              enabledBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(
                    width: 1,
                    color:
                        Theme.of(context).colorScheme.primary.withOpacity(0.5)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide:
                    BorderSide(color: Theme.of(context).colorScheme.primary),
              ),
              fillColor: Theme.of(context).colorScheme.primary.withOpacity(0.1),
              filled: true,
              prefixIcon: Opacity(
                opacity: 0.5,
                child: icon,
              )),
        ),
        SizedBox(
          height: sizedBoxHeight,
        )
      ],
    );
  }
}
