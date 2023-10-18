class LaundryListDummy {
  String imageLaundry;
  String namaLaundry;
  String alamatLaundry;
  String jam;
  String harga;

  LaundryListDummy({
    required this.imageLaundry,
    required this.namaLaundry,
    required this.alamatLaundry,
    required this.jam,
    required this.harga,
  });
}

final List<LaundryListDummy> laundryList = [
  LaundryListDummy(
    imageLaundry: "lib/assets/images/laundry_dummy.jpg",
    namaLaundry: "Laundry 1",
    alamatLaundry: "Jl. Jalan 1",
    jam: "08.00 - 20.00",
    harga: "Rp. 10.000",
  ),
  LaundryListDummy(
    imageLaundry: "lib/assets/images/laundry_dummy.jpg",
    namaLaundry: "Laundry 2",
    alamatLaundry: "Jl. Jalan 2",
    jam: "08.00 - 20.00",
    harga: "Rp. 10.000",
  ),
  LaundryListDummy(
    imageLaundry: "lib/assets/images/laundry_dummy.jpg",
    namaLaundry: "Laundry 3",
    alamatLaundry: "Jl. Jalan 3",
    jam: "08.00 - 20.00",
    harga: "Rp. 10.000",
  ),
  LaundryListDummy(
    imageLaundry: "lib/assets/images/laundry_dummy.jpg",
    namaLaundry: "Laundry 4",
    alamatLaundry: "Jl. Jalan 4",
    jam: "08.00 - 20.00",
    harga: "Rp. 10.000",
  ),
];
