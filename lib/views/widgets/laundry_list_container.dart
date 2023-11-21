import 'package:WashWoosh/utils/format_currency.dart';
import 'package:WashWoosh/utils/get_screen_size.dart';
import 'package:WashWoosh/utils/truncate_text_ellipsis.dart';
import 'package:flutter/material.dart';

class LaundryListContainer {
  String _laundryImage = "";
  String _laundryName = "";
  String _laundryAddress = "";
  String _laundryOpenHour = "";
  double _laundryPrice = 0;
  void Function()? _onTap;

  LaundryListContainer setImageLaundry(String image) {
    _laundryImage = image;
    return this;
  }

  LaundryListContainer setNamaLaundry(String nama) {
    _laundryName = nama;
    return this;
  }

  LaundryListContainer setAlamatLaundry(String alamat) {
    _laundryAddress = alamat;
    return this;
  }

  LaundryListContainer setJam(String jam) {
    _laundryOpenHour = jam;
    return this;
  }

  LaundryListContainer setHarga(double? harga) {
    _laundryPrice = harga ?? 0;
    return this;
  }

  LaundryListContainer setOnTap(void Function() onTap) {
    _onTap = onTap;
    return this;
  }

  Widget build(BuildContext context) {
    return InkWell(
      onTap: _onTap,
      child: Container(
          height: 150,
          width: GetScreenSize.getScreenWidth(context),
          decoration: BoxDecoration(
            border: Border.all(
              width: 1.5,
              color:
                  Theme.of(context).colorScheme.onBackground.withOpacity(0.1),
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset(
                          height: 110,
                          width: 140,
                          _laundryImage,
                          fit: BoxFit.cover),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _laundryName,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w800,
                                fontFamily: "Lato",
                                fontSize: 16),
                          ),
                          const SizedBox(height: 10),
                          Text(
                              TruncateTextWithEllipsis.truncateWithEllipsis(
                                  _laundryAddress, 18),
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontFamily: "Lato",
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Theme.of(context)
                                    .colorScheme
                                    .onBackground
                                    .withOpacity(0.3),
                              )),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              const Icon(Icons.access_time, size: 20),
                              const SizedBox(width: 5),
                              Expanded(
                                child: Text(_laundryOpenHour,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontFamily: "Lato",
                                      fontSize: 14,
                                      fontWeight: FontWeight.w800,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onBackground
                                          .withOpacity(0.5),
                                    )),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Harga mulai",
                                  style: TextStyle(
                                    fontFamily: "Lato",
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onBackground
                                        .withOpacity(0.3),
                                  )),
                              const SizedBox(width: 5),
                              Expanded(
                                child: Text(
                                  _laundryPrice == 0
                                      ? "-"
                                      : "${CurrencyFormatter.formatCurrency(_laundryPrice)}/kg",
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          )),
    );
  }
}
