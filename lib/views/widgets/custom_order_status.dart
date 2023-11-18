import 'package:WashWoosh/utils/get_screen_size.dart';
import 'package:WashWoosh/views/widgets/mitra_status_change_popup.dart';
import 'package:flutter/material.dart';

class CustomOrderStatus extends StatelessWidget {
  int orderId;
  int currentStatus;

  CustomOrderStatus(
      {super.key, required this.orderId, required this.currentStatus});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 190,
      width: GetScreenSize.getScreenWidth(context) * 0.9,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
          borderRadius: const BorderRadius.all(
            Radius.circular(15),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Status Pemesanan',
                      style: TextStyle(
                          fontFamily: "Lato",
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Beri tahu customermu bagaimana status pencucianmu',
                      style: TextStyle(
                          fontFamily: "Lato",
                          fontSize: 12,
                          color: Theme.of(context)
                              .colorScheme
                              .onBackground
                              .withOpacity(0.5)),
                    ),
                    Text(
                      'Pesanan ini dalam keadaan diproses',
                      style: TextStyle(
                          fontFamily: "Lato",
                          fontSize: 12,
                          color: Theme.of(context)
                              .colorScheme
                              .onBackground
                              .withOpacity(0.5)),
                    ),
                    SizedBox(
                      height: 50,
                      width: GetScreenSize.getScreenWidth(context) * 0.4,
                      child: OutlinedButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return Center(
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(24)),
                                  child: SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.8,
                                      child: MitraStatusChangePopup(
                                        laundryId: orderId,
                                        currentStatus: currentStatus,
                                      )),
                                ),
                              );
                            },
                          );
                        },
                        style: OutlinedButton.styleFrom(
                          backgroundColor:
                              Theme.of(context).colorScheme.secondary,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                        ),
                        child: const Text("Ubah Status",
                            style: TextStyle(
                                fontSize: 12,
                                fontFamily: "Inter",
                                fontWeight: FontWeight.bold,
                                color: Colors.white)),
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  const SizedBox(height: 20),
                  Image.asset(
                      'lib/assets/images/washing-machine-variations.png',
                      fit: BoxFit.contain,
                      width: 100),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
