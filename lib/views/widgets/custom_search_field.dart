import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomSearchField {
  TextEditingController? _controller;
  String _label = "Label";

  CustomSearchField setLabel(String label) {
    _label = label;
    return this;
  }

  Widget build(BuildContext context) {
    return SizedBox(
      child: TextField(
        maxLines: 1,
        controller: _controller,
        decoration: InputDecoration(
          hintText: _label,
          hintStyle: TextStyle(
              fontFamily: "Lato",
              fontWeight: FontWeight.w600,
              color: Theme.of(context)
                  .colorScheme
                  .onBackground
                  .withOpacity(0.4)),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 18, horizontal: 12),
          enabledBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(
                width: 1,
                color:
                    Theme.of(context).colorScheme.onBackground.withOpacity(0.1)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide:
                BorderSide(color: Theme.of(context).colorScheme.primary),
          ),
          fillColor: Theme.of(context).colorScheme.primary.withOpacity(0.1),
          suffixIcon: const Icon(Icons.search),
        ),
      ),
    );
  }
}
