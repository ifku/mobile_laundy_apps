import 'package:WashWoosh/views/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class Dummy extends StatelessWidget {
  const Dummy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("lib/assets/images/under-construction.png",
                  height: 360, width: 360)
            ],
          ),
          Text("Sedang dalam Perbaikan!",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: "Inter",
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: Theme.of(context).colorScheme.primary)),
          const SizedBox(height: 10),
          Text(
              "Situs lagi dirapiin nih. Halaman ini sedang dalam pengembangan agar lebih nyaman buat kamu",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: "Inter",
                  fontWeight: FontWeight.normal,
                  fontSize: 14,
                  color: Theme.of(context)
                      .colorScheme
                      .onBackground
                      .withOpacity(0.5))),
          const SizedBox(height: 30),
          CustomButton().setLabel("Kembali").setOnPressed(() {
            Navigator.pop(context);
          }).build(context)
        ],
      ),
    ));
  }
}
