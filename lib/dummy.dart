import 'package:flutter/material.dart';
import 'package:mobile_laundy_apps/views/widgets/laundry_detail_chooser.dart';

class Dummy extends StatelessWidget {
  const Dummy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(child: LaundryDetailChooser()),
      ),
    );
  }
}
