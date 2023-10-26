import 'package:WashWoosh/utils/date_formatter.dart';
import 'package:WashWoosh/utils/get_screen_size.dart';
import 'package:flutter/material.dart';

class CustomDetail extends StatelessWidget {
  String tanggalPemesanan = "2021-10-20";
  String estimasiPemesanan = "2021-10-20";
  double hargaTotal = 20000;

  CustomDetail(
      {super.key,
      required this.tanggalPemesanan,
      required this.estimasiPemesanan,
      required this.hargaTotal});

  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 130,
          width: GetScreenSize.getScreenWidth(context) * 0.9,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
              borderRadius: const BorderRadius.all(
                Radius.circular(15),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'Tanggal Pemesanan ${DateFormatter.format(tanggalPemesanan)}',
                    style: TextStyle(
                        fontFamily: "Inter",
                        fontSize: 12,
                        color: Theme.of(context)
                            .colorScheme
                            .onBackground
                            .withOpacity(0.5)),
                  ),
                  Text(
                    'Estimasi Selesai ${DateFormatter.format(estimasiPemesanan)}',
                    style: TextStyle(
                        fontFamily: "Inter",
                        fontSize: 12,
                        color: Theme.of(context)
                            .colorScheme
                            .onBackground
                            .withOpacity(0.5)),
                  ),
                  const Divider(
                    color: Colors.black,
                  ),
                  Text('Harga total: Rp. ${hargaTotal}'),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
