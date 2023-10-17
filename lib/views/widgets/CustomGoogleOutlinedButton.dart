import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile_laundy_apps/utils/GetScreenSize.dart';

class CustomGoogleOutlinedButton {
  String _label = "Label";
  Icon _icon = const Icon(Icons.add);

  double _sizedBoxHeight = 0;

  CustomGoogleOutlinedButton setLabel(String label) {
    _label = label;
    return this;
  }

  CustomGoogleOutlinedButton setIcon(Icon icon) {
    _icon = icon;
    return this;
  }

  CustomGoogleOutlinedButton setSizedBoxHeight(double sizedBoxHeight) {
    _sizedBoxHeight = sizedBoxHeight;
    return this;
  }

  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: GetScreenSize().getScreenWidth(context),
          height: 50,
          child: OutlinedButton.icon(
            onPressed: () {},
            icon: SvgPicture.asset(
              "lib/assets/icons/icon-google.svg",
              height: 30,
              width: 30,
            ),
            label: Text(_label,
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
                  color:
                      Theme.of(context).colorScheme.primary.withOpacity(0.5)),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            ),
          ),
        ),
        SizedBox(height: _sizedBoxHeight)
      ],
    );
  }
}
