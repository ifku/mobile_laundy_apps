import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile_laundy_apps/utils/GetScreenSize.dart';

class CustomOutlinedButton {
  String label = "Label";
  Icon icon = const Icon(Icons.add);

  CustomOutlinedButton setLabel(String label) {
    this.label = label;
    return this;
  }

  CustomOutlinedButton setIcon(Icon icon) {
    this.icon = icon;
    return this;
  }

  Widget build(BuildContext context) {
    return SizedBox(
      width: GetScreenSize().getScreenWidth(context),
      height: 50,
      child: OutlinedButton.icon(
        onPressed: () {},
        icon: SvgPicture.asset(
          "lib/assets/icons/icon-google.svg",
          height: 30,
          width: 30,
        ),
        label: Text(label,
            style: TextStyle(
                fontSize: 12,
                fontFamily: "Inter",
                color: Theme.of(context)
                    .colorScheme
                    .onBackground
                    .withOpacity(0.5))),
        style: OutlinedButton.styleFrom(
          primary: Colors.black,
          side: BorderSide(
              color: Theme.of(context).colorScheme.primary.withOpacity(0.5)),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
      ),
    );
  }
}
