import 'package:flutter/material.dart';

class OrderListStatusIcon {
  int? _idStatusPemesanan;

  OrderListStatusIcon setIdStatusPemesanan(int idStatusPemesanan) {
    _idStatusPemesanan = idStatusPemesanan;
    return this;
  }

  @override
  Widget build(BuildContext context) {
    Color _backgroundColor = backgroundColor(context, _idStatusPemesanan!);
    Icon _icon = icon(context, _idStatusPemesanan!);
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        color: _backgroundColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: _icon,
      ),
    );
  }

  Color iconColor(BuildContext context, int idStatusPemesanan) {
    if (idStatusPemesanan == 1) {
      return Colors.red;
    } else if (idStatusPemesanan == 2) {
      return Theme.of(context).colorScheme.primary;
    } else if (idStatusPemesanan == 3) {
      return Colors.green;
    }
    return Colors.red;
  }

  Color backgroundColor(BuildContext context, int idStatusPemesanan) {
    if (idStatusPemesanan == 1) {
      return Colors.red.withOpacity(0.3);
    } else if (idStatusPemesanan == 2) {
      return Theme.of(context).colorScheme.primary.withOpacity(0.3);
    } else if (idStatusPemesanan == 3) {
      return Colors.green.withOpacity(0.3);
    }
    return Colors.red.withOpacity(0.3);
  }

  Icon icon(BuildContext context, int idStatusPemesanan) {
    if (idStatusPemesanan == 1) {
      return Icon(Icons.access_time_rounded,
          color: iconColor(context, idStatusPemesanan));
    } else if (idStatusPemesanan == 2) {
      return Icon(Icons.history, color: iconColor(context, idStatusPemesanan));
    } else if (idStatusPemesanan == 3) {
      return Icon(Icons.check_circle_outline_rounded,
          color: iconColor(context, idStatusPemesanan));
    }
    return Icon(Icons.cancel_outlined,
        color: iconColor(context, idStatusPemesanan));
  }
}
