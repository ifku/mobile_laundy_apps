import 'package:WashWoosh/utils/format_currency.dart';
import 'package:WashWoosh/views/widgets/order_list_status_icon.dart';
import 'package:flutter/material.dart';

class OrderListCard {
  String _idPemesanan = "";
  String _name = "";
  String _orderDate = "";
  String _estDate = "";
  String _total = "";
  int status = 1;
  void Function()? onTap;

  OrderListCard setIdPemesanan(String id_pemesanan) {
    _idPemesanan = id_pemesanan;
    return this;
  }

  OrderListCard setLabel(String name) {
    _name = name;
    return this;
  }

  OrderListCard setOrderDate(String orderDate) {
    _orderDate = orderDate;
    return this;
  }

  OrderListCard setEstDate(String estDate) {
    _estDate = estDate;
    return this;
  }

  OrderListCard setTotal(String total) {
    _total = total;
    return this;
  }

  OrderListCard setStatus(int status) {
    this.status = status;
    return this;
  }

  OrderListCard setOnTap(void Function()? onTap) {
    this.onTap = onTap;
    return this;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Container(
            height: 130,
            decoration: BoxDecoration(
              border: Border.all(
                  color: Theme.of(context)
                      .colorScheme
                      .onBackground
                      .withOpacity(0.1)),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      OrderListStatusIcon()
                          .setIdStatusPemesanan(status)
                          .build(context),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(_name,
                            style: TextStyle(
                                fontFamily: "Lato",
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Theme.of(context)
                                    .colorScheme
                                    .onBackground)),
                      ),
                      Text("ID#$_idPemesanan",
                          style: TextStyle(
                              fontFamily: "Lato",
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Theme.of(context)
                                  .colorScheme
                                  .onBackground
                                  .withOpacity(0.3))),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(width: 50),
                      Expanded(
                        child: Text("Tanggal Order",
                            style: TextStyle(
                                fontFamily: "Lato",
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Theme.of(context)
                                    .colorScheme
                                    .onBackground
                                    .withOpacity(0.3))),
                      ),
                      Text(_orderDate,
                          style: TextStyle(
                              fontFamily: "Lato",
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Theme.of(context)
                                  .colorScheme
                                  .onBackground
                                  .withOpacity(0.3))),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(width: 50),
                      Expanded(
                        child: Text("Estimasi Selesai",
                            style: TextStyle(
                                fontFamily: "Lato",
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Theme.of(context)
                                    .colorScheme
                                    .onBackground
                                    .withOpacity(0.3))),
                      ),
                      Text(_estDate,
                          style: TextStyle(
                              fontFamily: "Lato",
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Theme.of(context)
                                  .colorScheme
                                  .onBackground
                                  .withOpacity(0.3))),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(width: 50),
                      Expanded(
                        child: Text("Total",
                            style: TextStyle(
                                fontFamily: "Lato",
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                color: Theme.of(context)
                                    .colorScheme
                                    .onBackground
                                    .withOpacity(0.5))),
                      ),
                      Text(
                          CurrencyFormatter.formatCurrency(
                              double.parse(_total)),
                          style: TextStyle(
                              fontFamily: "Lato",
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: Theme.of(context)
                                  .colorScheme
                                  .onBackground
                                  .withOpacity(0.5))),
                    ],
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
