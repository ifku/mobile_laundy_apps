import 'package:WashWoosh/bloc/auth/login/login_bloc.dart';
import 'package:WashWoosh/bloc/user/bottom_navigation/bottom_navigation_bloc.dart';
import 'package:WashWoosh/bloc/user/laundry/laundry_list_bloc.dart';
import 'package:WashWoosh/bloc/user/laundry_history/laundry_history_bloc.dart';
import 'package:WashWoosh/bloc/user/laundry_history_detail/laundry_history_detail_bloc.dart';
import 'package:WashWoosh/data/repositories/local/user_preferences.dart';
import 'package:WashWoosh/routes/routes.dart';
import 'package:WashWoosh/utils/date_formatter.dart';
import 'package:WashWoosh/views/widgets/custom_user_bottom_navbar.dart';
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
  Widget build(BuildContext context) {
    return BlocConsumer<BottomNavigationBloc, BottomNavigationState>(
      listener: (context, state) {
        if (state is BottomNavigationInitial) {
          if (state.index == 0) {
            Navigator.pop(context);
          } else if (state.index == 1) {
            Navigator.pushReplacementNamed(context, AppRoutes.userOrderHistory);
          }
        }
      },
      builder: (context, state) {
        if (state is BottomNavigationInitial) {
          return Scaffold(
              bottomNavigationBar: CustomUserBottomNavbar(
                currentIndex: state.index,
                backgroundColor: Theme
                    .of(context)
                    .colorScheme
                    .primary,
                selectedItemColor: Theme
                    .of(context)
                    .colorScheme
                    .secondary,
                unselectedItemColor: Theme
                    .of(context)
                    .colorScheme
                    .onPrimary,
                showLabel: false,
                onTap: (int value) {
                  BlocProvider.of<BottomNavigationBloc>(context)
                      .add(BottomNavigationItemClicked(index: value));
                },
              ),
              body: BlocBuilder<LaundryHistoryBloc, LaundryHistoryState>(
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
                                  padding: const EdgeInsets.only(
                                      left: 14, right: 14, top: 50),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Align(
                                                alignment: Alignment.topLeft,
                                                child: BlocBuilder<
                                                    LaundryListBloc,
                                                    LaundryListState>(
                                                  builder: (context, state) {
                                                    if(state is LaundryListSuccess){
                                                      return UserMiniProfileCard()
                                                          .setImageProfile(
                                                          "lib/assets/images/avatar_dummy.png")
                                                          .setNameProfile(state.userData.nama)
                                                          .setEmailProfile(state.userData.email)
                                                          .build(context);
                                                    }
                                                    return const SizedBox();
                                                  },
                                                )
                                            ),
                                          ),
                                          IconButton(
                                            onPressed: () async {
                                              WidgetsBinding.instance
                                                  .addPostFrameCallback((_) {
                                                final loginBloc =
                                                BlocProvider.of<LoginBloc>(
                                                    context);
                                                loginBloc
                                                    .add(LogoutButtonPressed());
                                                Navigator
                                                    .pushNamedAndRemoveUntil(
                                                    context,
                                                    AppRoutes.shadowPage,
                                                        (Route<dynamic>
                                                    route) =>
                                                    false);
                                              });
                                            },
                                            icon: Icon(
                                              Icons.logout_rounded,
                                              size: 25,
                                              color: Theme
                                                  .of(context)
                                                  .colorScheme
                                                  .onBackground
                                                  .withOpacity(0.5),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 30),
                                      const Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
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
                                    physics:
                                    const NeverScrollableScrollPhysics(),
                                    itemBuilder: (context, index) {
                                      return OrderListCard()
                                          .setIdPemesanan(state
                                          .data.data[index].id
                                          .toString())
                                          .setLabel(state
                                          .data.data[index].customer.nama)
                                          .setOrderDate(DateFormatter.format(
                                          state
                                              .data.data[index].tanggalPesan
                                              .toString()))
                                          .setEstDate(DateFormatter.format(state
                                          .data
                                          .data[index]
                                          .estimasiTanggalSelesai
                                          .toString()))
                                          .setTotal(state.data.data[index].harga
                                          .toString())
                                          .setStatus(state.data.data[index]
                                          .statusPemesananId)
                                          .setOnTap(() {
                                        _onOrderItemTap(
                                            context, state.data.data[index].id);
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
              ));
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}

void _onOrderItemTap(BuildContext context, int laundryId) async {
  final laundryListBloc = BlocProvider.of<LaundryHistoryDetailBloc>(context);
  final token = await UserPreferences.getToken();
  laundryListBloc
      .add(OrderListItemClicked(token: token['token'], laundryId: laundryId));
  WidgetsBinding.instance.addPostFrameCallback((_) {
    Navigator.pushNamed(context, AppRoutes.userOrderDetail);
  });
}
