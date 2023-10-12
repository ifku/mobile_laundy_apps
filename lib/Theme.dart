import 'package:flutter/material.dart';

class CustomTheme{
  MaterialColor primaryColor = const MaterialColor(
    0xFF5483ED,
    <int, Color>{
      50: Color(0xFFEAF0FD),
      100: Color(0xFFCCDAFA),
      200: Color(0xFFAAC1F6),
      300: Color(0xFF87A8F2),
      400: Color(0xFF6E96F0),
      500: Color(0xFF5483ED),
      600: Color(0xFF4D7BEB),
      700: Color(0xFF4370E8),
      800: Color(0xFF3A66E5),
      900: Color(0xFF2953E0),
    },
  );
  MaterialColor secondaryColor = const MaterialColor(
    0XFFFFC857,
    <int, Color>{
      50: Color(0XFFFFF8E1),
      100: Color(0XFFFFF1C2),
      200: Color(0XFFFFE99F),
      300: Color(0XFFFFE17C),
      400: Color(0XFFFFDB61),
      500: Color(0XFFFFD546),
      600: Color(0XFFFFD03F),
      700: Color(0XFFFFCA36),
      800: Color(0XFFFFC42D),
      900: Color(0XFFFFB61B),
    },
  );
}
