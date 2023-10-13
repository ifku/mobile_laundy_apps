import 'package:flutter/material.dart';

class CustomDividerWithText {
  String label = "label";

  CustomDividerWithText setLabel(String label) {
    this.label = label;
    return this;
  }

  Widget build(BuildContext context) {
    return Row(children: <Widget>[
      const Expanded(
          child: Divider(
        thickness: 2,
      )),
      const SizedBox(width: 10),
      Text(label,
          style: TextStyle(
              fontFamily: "Inter",
              fontSize: 12,
              color:
                  Theme.of(context).colorScheme.onBackground.withOpacity(0.5))),
      const SizedBox(width: 10),
      const Expanded(child: Divider(thickness: 2)),
    ]);
  }
}
