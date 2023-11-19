import 'package:flutter/material.dart';

class CustomPaymentStatus extends StatelessWidget {
  final bool isDibayar;

  const CustomPaymentStatus({
    Key? key,
    required this.isDibayar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: isDibayar
                ? const Color(0xFF00C27C)
                : const Color(0xFFFF4E4E),
            width: 2,
          ),
          color: Colors.white,
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 3),
            child: FittedBox(
              child: Text(
                isDibayar ? 'Selesai' : 'Belum di bayar',
                // Change text based on isDibayar
                style: TextStyle(
                  fontFamily: "Inter",
                  fontSize: isDibayar ? 12 : 11,
                  color: isDibayar
                      ? const Color(0xFF00C27C)
                      : const Color(0xFFFF4E4E),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
