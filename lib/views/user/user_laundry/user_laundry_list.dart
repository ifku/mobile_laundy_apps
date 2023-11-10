import 'dart:math';

import 'package:WashWoosh/bloc/auth/login/login_bloc.dart';
import 'package:WashWoosh/bloc/user/laundry/laundry_list_bloc.dart';
import 'package:WashWoosh/bloc/user/laundry_detail/laundry_detail_bloc.dart';
import 'package:WashWoosh/bloc/user/laundry_history/laundry_history_bloc.dart';
import 'package:WashWoosh/const/laundry_list.dart';
import 'package:WashWoosh/data/repositories/local/user_preferences.dart';
import 'package:WashWoosh/laundry_list_shimmer.dart';
import 'package:WashWoosh/routes/routes.dart';
import 'package:WashWoosh/utils/truncate_text_ellipsis.dart';
import 'package:WashWoosh/views/user/user_laundry/user_laundry_list.dart';
import 'package:WashWoosh/views/widgets/custom_bottom_navbar.dart';
import 'package:WashWoosh/views/widgets/custom_filter_button.dart';
import 'package:WashWoosh/views/widgets/custom_search_field.dart';
import 'package:WashWoosh/views/widgets/laundry_list_container.dart';
import 'package:WashWoosh/views/widgets/user_mini_profile_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LaundryList extends StatefulWidget {
  const LaundryList({Key? key}) : super(key: key);

  @override
  State<LaundryList> createState() => _LaundryListState();
}

class _LaundryListState extends State<LaundryList> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      initializeData();
    });
  }

  Future<void> initializeData() async {
    final laundryListBloc = BlocProvider.of<LaundryListBloc>(context);
    final token = await UserPreferences.getToken();
    if (token != null) {
      laundryListBloc.add(GetLaundryList(token: token['token']));
    }
  }

  @override
  Widget build(BuildContext context) {
    final random = Random();
    int randomIndex = random.nextInt(laundryList.length);
    return Scaffold(
        bottomNavigationBar: CustomBottomNavbar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          selectedItemColor: Theme.of(context).colorScheme.secondary,
          unselectedItemColor: Theme.of(context).colorScheme.onPrimary,
          showLabel: false,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined), label: "Beranda"),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_bag_outlined), label: "Laundry"),
            BottomNavigationBarItem(
                icon: Icon(Icons.dataset_outlined), label: "Pesanan"),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_3_outlined), label: "Profil"),
          ],
          onTap: (int value) {
            switch (value) {
              case 0:
                Navigator.pushNamed(
                    context, AppRoutes.userLaundryList);
                break;
              case 1:
                Navigator.pushNamed(
                    context, AppRoutes.userLaundryList);
                break;
              case 2:
                Navigator.pushNamed(
                    context, AppRoutes.userOrderHistory);
                getOrderHistory(context);
                break;
              case 3:
                Navigator.pushNamed(context, AppRoutes.userProfile);
                break;
            }
          },
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 14, right: 14, top: 50),
            child: Column(
              children: [
                Row(
                  children: [
                    Align(
                        alignment: Alignment.topLeft,
                        child: UserMiniProfileCard()
                            .setImageProfile(
                                "lib/assets/images/avatar_dummy.png")
                            .setNameProfile("Mimin Laundry")
                            .setAddressProfile(
                                "Gebang Lor 73, Sukolilo, Surabaya")
                            .build(context)),
                    const Spacer(),
                    ElevatedButton(
                        onPressed: () async {
                          WidgetsBinding.instance.addPostFrameCallback((_) {
                            final loginBloc =
                                BlocProvider.of<LoginBloc>(context);
                            loginBloc.add(LogoutButtonPressed());
                            Navigator.pushReplacementNamed(
                                context, AppRoutes.shadowPage);
                          });
                        },
                        child: const Text("Logout")),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: CustomSearchField()
                          .setLabel("Cari Laundry Terdekat")
                          .build(context),
                    ),
                    const SizedBox(width: 20),
                    CustomFilterButton().setOnPressed(() {}).build(context),
                  ],
                ),
                BlocBuilder<LaundryListBloc, LaundryListState>(
                  builder: (context, state) {
                    if (state is LaundryListLoading) {
                      return const LaundryListShimmer();
                    } else if (state is LaundryListSuccess) {
                      return ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: state.laundryList.length,
                        itemBuilder: (context, index) {
                          final laundryItem = state.laundryList[index];
                          return Column(
                            children: [
                              LaundryListContainer()
                                  .setNamaLaundry(TruncateTextWithEllipsis
                                      .truncateWithEllipsis(
                                          laundryItem.nama, 20))
                                  .setImageLaundry(
                                      laundryList[randomIndex].imageLaundry)
                                  .setAlamatLaundry(laundryItem.alamat)
                                  .setJam("07.00 AM - 09.00 PM")
                                  .setHarga(laundryItem.hargaRapi)
                                  .setOnTap(() {
                                _onLaundryItemTap(context, laundryItem.id);
                              }).build(context),
                              const SizedBox(height: 20),
                            ],
                          );
                        },
                      );
                    } else if (state is LaundryListError) {
                      print(state.errorMessage);
                      return Center(
                        child: Text('Error: ${state.errorMessage}'),
                      );
                    } else {
                      return const Center(
                        child: Text('Tidak ada data.'),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ));
  }
}

void _onLaundryItemTap(BuildContext context, int laundryId) async {
  final laundryListBloc = BlocProvider.of<LaundryDetailBloc>(context);
  final token = await UserPreferences.getToken();
  if (token != null) {
    laundryListBloc.add(
        LaundryListItemClicked(token: token['token'], laundryId: laundryId));
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Navigator.pushNamed(context, AppRoutes.userLaundryDetail);
    });
  }
}

Future<void> getOrderHistory(BuildContext context) async {
  final laundryHistoryBloc = BlocProvider.of<LaundryHistoryBloc>(context);
  final token = await UserPreferences.getToken();
  laundryHistoryBloc.add(GetLaundryHistory(token: token['token']));
}
