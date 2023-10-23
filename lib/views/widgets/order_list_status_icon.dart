import 'package:flutter/material.dart';

class OrderListStatusIcon {
  int? _idStatusPemesanan;

  OrderListStatusIcon setIdStatusPemesanan (int idStatusPemesanan){
    _idStatusPemesanan = idStatusPemesanan;
    return this;
  }
  @override
  Widget build(BuildContext context) {
    Color _iconColor = Theme.of(context).colorScheme.primary.withOpacity(0.5);
    _iconColor = checkIdStatusPemesanan(_idStatusPemesanan!);
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        color: Colors.red.withOpacity(0.3),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: Icon(Icons.circle_notifications_outlined, color: _iconColor),
      ),
    );
  }
}


Color checkIdStatusPemesanan(int idStatusPemesanan) {
  if (idStatusPemesanan == 1) {
    return Colors.green;
  } else if (idStatusPemesanan == 2) {
    return Colors.blue;
  } else if(idStatusPemesanan == 3){
    return Colors.yellow;
  }
  return Colors.red;
}
