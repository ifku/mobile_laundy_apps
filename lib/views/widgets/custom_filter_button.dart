import 'package:flutter/material.dart';

class CustomFilterButton {
  void Function()? _onPressed;

  CustomFilterButton setOnPressed(void Function() onPressed) {
    _onPressed = onPressed;
    return this;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _onPressed,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(10)),
        child: const Icon(Icons.filter_list_rounded, color: Colors.white),
      ),
    );
  }
}
