import 'package:WashWoosh/utils/get_screen_size.dart';
import 'package:WashWoosh/views/widgets/custom_outlined_button.dart';
import 'package:WashWoosh/views/widgets/mitra_status_change_popup.dart';
import 'package:flutter/material.dart';

class CustomUserOrderStatus extends StatelessWidget {
  int orderId;
  int currentStatus;

  String? label;
  String? description;

  CustomUserOrderStatus(
      {super.key, required this.orderId, required this.currentStatus});

  Widget build(BuildContext context) {
    return SizedBox(
      height: 190,
      width: GetScreenSize.getScreenWidth(context) * 0.9,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
          borderRadius: const BorderRadius.all(
            Radius.circular(15),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Status Pemesanan',
                      style: TextStyle(
                          fontFamily: "Lato",
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      setOrderStatus(currentStatus),
                      style: TextStyle(
                          fontFamily: "Lato",
                          fontSize: 12,
                          color: Theme.of(context)
                              .colorScheme
                              .onBackground
                              .withOpacity(0.5)),
                    ),
                    SizedBox(
                      width: GetScreenSize.getScreenWidth(context) * 0.5,
                      child: CustomOutlinedButton()
                          .setLabel(setOrderLabel(currentStatus))
                          .build(context),
                    )
                  ],
                ),
              ),
              Column(
                children: [
                  const SizedBox(height: 20),
                  Image.asset(
                      'lib/assets/images/washing-machine-variations.png',
                      fit: BoxFit.contain,
                      width: 100),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

String setOrderLabel(int statusPemesananId) {
  switch (statusPemesananId) {
    case 1:
      return "Sudah di Terima";
    case 2:
      return "Sedang di Proses";
    case 3:
      return "Sudah Selesai";
    default:
      return "Tidak ada status";
  }
}

String setOrderStatus(int statusPemesananId) {
  switch (statusPemesananId) {
    case 1:
      return "\"Pemesanan sudah diterima! Pesananmu akan disiapkan dengan penuh semangat.\"";
    case 2:
      return "\"Hore, pemesanan laundry kamu sudah dalam proses, nih! Tunggu sebentar lagi, ya!\"";
    case 3:
      return "\"Pemesanan kamu sudah selesai! Silakan datang dan ambil pakaian kamu kapan saja.\"";
    default:
      return "Tidak ada status";
  }
}

