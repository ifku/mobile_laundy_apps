import 'package:flutter/material.dart';

class CustomTextArea {
  TextEditingController? _controller;
  String _label = "Label";
  double _labelFontSize = 12;
  Icon _icon = const Icon(Icons.abc);
  double _sizedBoxHeight = 0;

  bool _isFilledForm = true;

  CustomTextArea setController(TextEditingController _controller) {
    this._controller = _controller;
    return this;
  }

  CustomTextArea setLabel(String label) {
    _label = label;
    return this;
  }

  CustomTextArea setLabelFontSize(double fontSize) {
    _labelFontSize = fontSize;
    return this;
  }

  CustomTextArea setIcon(Icon icon) {
    _icon = icon;
    return this;
  }

  CustomTextArea setSizedBoxHeight(double height) {
    _sizedBoxHeight = height;
    return this;
  }

  CustomTextArea setIsFilledForm(bool isFilledForm) {
    _isFilledForm = isFilledForm;
    return this;
  }

  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          child: TextField(
            controller: _controller,
            maxLines: 5,
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.primary,
                      width: 1,
                    )),
                hintText: _label,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color:
                        Theme.of(context).colorScheme.primary.withOpacity(0.5),
                    width: 1,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide:
                      BorderSide(color: Theme.of(context).colorScheme.primary),
                ),
                filled: _isFilledForm,
                fillColor:
                    Theme.of(context).colorScheme.primary.withOpacity(0.1),
                hintStyle: TextStyle(
                    fontSize: _labelFontSize,
                    fontFamily: "Lato",
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context)
                        .colorScheme
                        .onBackground
                        .withOpacity(0.4)),
                prefixIcon: Opacity(
                  opacity: 0.5,
                  child: _icon,
                ),
                contentPadding: const EdgeInsets.symmetric(vertical: 20)),
          ),
        ),
        SizedBox(height: _sizedBoxHeight)
      ],
    );
  }
}
