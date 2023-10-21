class LaundryChooserList {
  String label;
  double price;

  LaundryChooserList({
    required this.label,
    required this.price,
  });
}

final List<LaundryChooserList> laundryChooserList = [
  LaundryChooserList(label: "Cuci Rapi", price: 5000),
  LaundryChooserList(label: "Cuci Kering", price: 4000),
  LaundryChooserList(label: "Cuci Basah", price: 3000),
  LaundryChooserList(label: "Cuci Satuan", price: 1500),
];
