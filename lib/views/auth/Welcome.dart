import 'package:flutter/material.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.5),
        ),
        // Column(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: [
        //     CustomAlert()
        //     .setHeader("Selamat!")
        //     .setImage("lib/assets/images/wireframe.png")
        //     .setMessage("Email kamu telah berhasil diverifikasi. Segera masuk dan mulai menggunakannya")
        //     .setButtonLabel("Dashboard")
        //     .build(context)
        //   ],
        // )
      ),
    );
  }
}
