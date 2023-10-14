import 'package:flutter/material.dart';

class CustomInputField {
  TextEditingController? _controller;
  String _label = "Label";
  double _labelFontSize = 12;
  bool _obscureText = false;
  Icon _icon = const Icon(Icons.abc);
  double _sizedBoxHeight = 0;
  bool _isFilledForm = true;

  TextInputType _keyboardType = TextInputType.text;
  CustomInputField setController(TextEditingController controller) {
    _controller = controller;
    return this;
  }

  CustomInputField setLabel(String label) {
    _label = label;
    return this;
  }

  CustomInputField setLabelFontSize(double fontSize) {
    _labelFontSize = fontSize;
    return this;
  }

  CustomInputField setIcon(Icon icon) {
    _icon = icon;
    return this;
  }

  CustomInputField setObscureText(bool obscureText) {
    _obscureText = obscureText;
    return this;
  }

  CustomInputField setSizedBoxHeight(double height) {
    _sizedBoxHeight = height;
    return this;
  }
  CustomInputField setIsFilledForm(bool isFilledForm) {
    _isFilledForm = isFilledForm;
    return this;
  }

  CustomInputField setKeyboardType(TextInputType keyboardType) {
    _keyboardType = keyboardType;
    return this;
  }

  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TextField(
          maxLines: 1,
          controller: _controller,
          obscureText: _obscureText,
          keyboardType: _keyboardType,
          decoration: InputDecoration(
              hintText: _label,
              hintStyle: TextStyle(
                  fontSize: _labelFontSize,
                  fontFamily: "Lato",
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context)
                      .colorScheme
                      .onBackground
                      .withOpacity(0.4)),
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
              filled: _isFilledForm,
              prefixIcon: Opacity(
                opacity: 0.5,
                child: _icon,
              ),
          ),
        ),
        SizedBox(
          height: _sizedBoxHeight,
        )
      ],
    );
  }
}
