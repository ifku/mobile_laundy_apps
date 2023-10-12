import 'package:flutter/material.dart';

class CustomDividerWithText {
  String label = "label";

  CustomDividerWithText setLabel(String label) {
    this.label = label;
    return this;
  }

  Widget build(BuildContext context) {
    return Row(children: <Widget>[
      const Expanded(child: Divider(thickness: 2,)),
      const SizedBox(width: 10),
      Text(label),
      const SizedBox(width: 10),
      const Expanded(child: Divider(thickness: 2)),
    ]);
  }
}
