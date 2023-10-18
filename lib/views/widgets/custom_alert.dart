import 'package:flutter/material.dart';
import 'package:mobile_laundy_apps/utils/get_screen_size.dart';
import 'package:mobile_laundy_apps/views/widgets/custom_button.dart';

class CustomAlert {
  String _header = "Header";
  String _message = "Message";
  String _buttonLabel = "Button Label";

  String _image = "";

  CustomAlert setHeader(String header) {
    _header = header;
    return this;
  }

  CustomAlert setMessage(String message) {
    _message = message;
    return this;
  }

  CustomAlert setButtonLabel(String buttonLabel) {
    _buttonLabel = buttonLabel;
    return this;
  }

  CustomAlert setImage(String image) {
    _image = image;
    return this;
  }

  Widget build(BuildContext context) {
    return SizedBox(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 36),
      child: Container(
        height: GetScreenSize.getScreenHeight(context) / 2,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(25)),
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                _image,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 10),
              Text(
                _header,
                style: TextStyle(
                  fontFamily: "Lato",
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                _message,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: "Inter",
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Theme.of(context)
                      .colorScheme
                      .onBackground
                      .withOpacity(0.5),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: GetScreenSize.getScreenWidth(context),
                child: CustomButton()
                    .setLabel(_buttonLabel)
                    .setOnPressed(() {})
                    .setButtonHeight(55)
                    .build(context),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
