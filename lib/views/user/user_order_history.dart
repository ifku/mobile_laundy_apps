import 'package:WashWoosh/bloc/auth/login/login_bloc.dart';
import 'package:WashWoosh/bloc/user/laundry_history/laundry_history_bloc.dart';
import 'package:WashWoosh/data/repositories/local/user_preferences.dart';
import 'package:WashWoosh/routes/routes.dart';
import 'package:WashWoosh/utils/date_formatter.dart';
import 'package:WashWoosh/views/widgets/custom_button.dart';
import 'package:WashWoosh/views/widgets/custom_pemesanan_popup.dart';
import 'package:WashWoosh/views/widgets/order_list_card.dart';
import 'package:WashWoosh/views/widgets/user_mini_profile_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserOrderHistory extends StatefulWidget {
  const UserOrderHistory({super.key});

  @override
  State<UserOrderHistory> createState() => _UserOrderHistoryState();
}

class _UserOrderHistoryState extends State<UserOrderHistory> {
  @override
  void dispose() {
    super.dispose();
    final laundryHistoryBloc = BlocProvider.of<LaundryHistoryBloc>(context);
    laundryHistoryBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LaundryHistoryBloc, LaundryHistoryState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        if (state is GetLaundryHistoryLoading) {
          return const Scaffold(
              body: Center(
            child: CircularProgressIndicator(),
          ));
        } else if (state is GetLaundryHistorySuccess) {
          return Scaffold(
            body: Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 14, right: 14, top: 50),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: UserMiniProfileCard()
                                        .setImageProfile(
                                            "lib/assets/images/avatar_dummy.png")
                                        .setNameProfile("Mimin Laundry")
                                        .setAddressProfile(
                                            "Gebang Lor 73, Sukolilo, Surabaya")
                                        .build(context),
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: () async {
                                    WidgetsBinding.instance
                                        .addPostFrameCallback((_) {
                                      final loginBloc =
                                          BlocProvider.of<LoginBloc>(context);
                                      loginBloc.add(LogoutButtonPressed());
                                      Navigator.pushReplacementNamed(
                                          context, AppRoutes.shadowPage);
                                    });
                                  },
                                  child: const Text("Logout"),
                                ),
                              ],
                            ),
                            const SizedBox(height: 30),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Pesanan Terbaru",
                                    style: TextStyle(
                                        fontFamily: "Lato",
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold)),
                                /*InkWell(
                                  onTap: () {},
                                  child: Text(
                                    "Lihat Semua",
                                    style: TextStyle(
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                    ),
                                  ),
                                ),*/
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 14, right: 14, top: 0, bottom: 80),
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: state.data.data.length,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return OrderListCard()
                                .setIdPemesanan(
                                    state.data.data[index].id.toString())
                                .setLabel(state.data.data[index].customer.nama)
                                .setOrderDate(DateFormatter.format(state
                                    .data.data[index].tanggalPesan
                                    .toString()))
                                .setEstDate(DateFormatter.format(state
                                    .data.data[index].estimasiTanggalSelesai
                                    .toString()))
                                .setTotal(
                                    state.data.data[index].harga.toString())
                                .setStatus(
                                    state.data.data[index].statusPemesananId)
                                .setOnTap(() {
                              // _onOrderItemTap(
                              //     context, state.data.data[index].id);
                            }).build(context);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }
        return Scaffold(
          body: Center(
            child: Text("Data tidak tersedia"),
          ),
        );
      },
    );
  }
}
