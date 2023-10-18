import 'package:flutter/material.dart';

class LaundryListContainer {
  String _imageLaundry = "";
  String _namaLaundry = "";
  String _alamatLaundry = "";
  String _jam = "";
  String _harga = "";
  void Function()? _onTap;

  LaundryListContainer setImageLaundry(String image) {
    _imageLaundry = image;
    return this;
  }

  LaundryListContainer setNamaLaundry(String nama) {
    _namaLaundry = nama;
    return this;
  }

  LaundryListContainer setAlamatLaundry(String alamat) {
    _alamatLaundry = alamat;
    return this;
  }

  LaundryListContainer setJam(String jam) {
    _jam = jam;
    return this;
  }

  LaundryListContainer setHarga(String harga) {
    _harga = harga;
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
          width: 400,
          decoration: BoxDecoration(
            border: Border.all(
              width: 1.5,
              color:
                  Theme.of(context).colorScheme.onBackground.withOpacity(0.2),
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
                    padding: const EdgeInsets.all(16.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset(
                          height: 110,
                          width: 140,
                          _imageLaundry,
                          fit: BoxFit.cover),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _namaLaundry,
                        style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w800,
                            fontFamily: "Lato",
                            fontSize: 20),
                      ),
                      const SizedBox(height: 10),
                      Text(_alamatLaundry,
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
                          Text(_jam,
                              style: TextStyle(
                                fontFamily: "Lato",
                                fontSize: 14,
                                fontWeight: FontWeight.w800,
                                color: Theme.of(context)
                                    .colorScheme
                                    .onBackground
                                    .withOpacity(0.5),
                              )),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
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
                          Text(_harga,
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .secondary
                                      .withOpacity(0.8))),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          )),
    );
  }
}
