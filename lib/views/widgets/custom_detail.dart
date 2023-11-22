import 'package:WashWoosh/utils/date_formatter.dart';
import 'package:WashWoosh/utils/get_screen_size.dart';
import 'package:WashWoosh/views/widgets/custom_detail.dart';
import 'package:WashWoosh/utils/format_currency.dart';
import 'package:WashWoosh/views/widgets/custom_payment_status.dart';
import 'package:flutter/material.dart';

class CustomDetail extends StatelessWidget {
  String tanggalPemesanan = "2021-10-20";
  String estimasiPemesanan = "2021-10-20";
  double hargaTotal = 20000;

  bool isDibayar = false;

  CustomDetail(
      {super.key,
      required this.tanggalPemesanan,
      required this.estimasiPemesanan,
      required this.hargaTotal,
      required this.isDibayar});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 160,
          width: GetScreenSize.getScreenWidth(context) * 0.9,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
              borderRadius: const BorderRadius.all(
                Radius.circular(15),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Status Pembayaran',
                        style: TextStyle(
                            fontFamily: "Inter",
                            fontSize: 12,
                            color: Theme.of(context)
                                .colorScheme
                                .onBackground
                                .withOpacity(0.5)),
                      ),
                      CustomPaymentStatus(isDibayar: isDibayar)
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Tanggal Pemesanan',
                        style: TextStyle(
                            fontFamily: "Inter",
                            fontSize: 12,
                            color: Theme.of(context)
                                .colorScheme
                                .onBackground
                                .withOpacity(0.5)),
                      ),
                      Text(
                        DateFormatter.format(tanggalPemesanan),
                        style: TextStyle(
                            fontFamily: "Inter",
                            fontSize: 12,
                            color: Theme.of(context)
                                .colorScheme
                                .onBackground
                                .withOpacity(0.5)),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Estimasi Selesai',
                        style: TextStyle(
                            fontFamily: "Inter",
                            fontSize: 12,
                            color: Theme.of(context)
                                .colorScheme
                                .onBackground
                                .withOpacity(0.5)),
                      ),
                      Text(
                        DateFormatter.format(estimasiPemesanan),
                        style: TextStyle(
                            fontFamily: "Inter",
                            fontSize: 12,
                            color: Theme.of(context)
                                .colorScheme
                                .onBackground
                                .withOpacity(0.5)),
                      ),
                    ],
                  ),
                  const Divider(
                    color: Colors.black,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Harga total:',
                          style: TextStyle(
                              fontFamily: "Inter",
                              fontSize: 12,
                              color: Colors.black)),
                      Text( CurrencyFormatter.formatCurrency(hargaTotal),
                          style: const TextStyle(
                              fontFamily: "Inter",
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.black))
                    ],
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
