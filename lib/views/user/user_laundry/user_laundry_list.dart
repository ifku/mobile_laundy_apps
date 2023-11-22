import 'dart:math';

import 'package:WashWoosh/bloc/auth/login/login_bloc.dart';
import 'package:WashWoosh/bloc/user/bottom_navigation/bottom_navigation_bloc.dart';
import 'package:WashWoosh/bloc/user/laundry/laundry_list_bloc.dart';
import 'package:WashWoosh/bloc/user/laundry_detail/laundry_detail_bloc.dart';
import 'package:WashWoosh/bloc/user/laundry_history/laundry_history_bloc.dart';
import 'package:WashWoosh/const/laundry_list.dart';
import 'package:WashWoosh/data/repositories/local/user_preferences.dart';
import 'package:WashWoosh/routes/routes.dart';
import 'package:WashWoosh/utils/truncate_text_ellipsis.dart';
import 'package:WashWoosh/views/widgets/custom_search_field.dart';
import 'package:WashWoosh/views/widgets/custom_user_bottom_navbar.dart';
import 'package:WashWoosh/views/widgets/laundry_list_container.dart';
import 'package:WashWoosh/views/widgets/shimmer/laundry_list_shimmer.dart';
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
    laundryListBloc.add(GetLaundryList(token: token['token']));
  }

  @override
  Widget build(BuildContext context) {
    final random = Random();
    int randomIndex = random.nextInt(laundryList.length);
    return BlocConsumer<BottomNavigationBloc, BottomNavigationState>(
      listener: (context, state) {
        if (state is BottomNavigationInitial) {
          if (state.index == 0) {
            Navigator.pushReplacementNamed(context, AppRoutes.userLaundryList);
          } else if (state.index == 1) {
            getOrderHistory(context);
            Navigator.pushNamed(context, AppRoutes.userOrderHistory);
          }
        }
      },
      builder: (context, state) {
        if (state is BottomNavigationInitial) {
          return Scaffold(
            bottomNavigationBar: CustomUserBottomNavbar(
              currentIndex: state.index,
              backgroundColor: Theme.of(context).colorScheme.primary,
              selectedItemColor: Theme.of(context).colorScheme.secondary,
              unselectedItemColor: Theme.of(context).colorScheme.onPrimary,
              showLabel: false,
              onTap: (int value) {
                BlocProvider.of<BottomNavigationBloc>(context)
                    .add(BottomNavigationItemClicked(index: value));
              },
            ),
            body: BlocBuilder<LaundryListBloc, LaundryListState>(
              builder: (context, state) {
                if (state is LaundryListSuccess) {
                  return RefreshIndicator(
                    onRefresh: () async {
                      await initializeData();
                    },
                    child: SingleChildScrollView(
                      child: Padding(
                        padding:
                            const EdgeInsets.only(left: 14, right: 14, top: 40),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Align(
                                    alignment: Alignment.topLeft,
                                    child: UserMiniProfileCard()
                                        .setImageProfile(
                                            "lib/assets/images/avatar_dummy.png")
                                        .setNameProfile(state.userData.nama)
                                        .setEmailProfile(state.userData.email)
                                        .build(context)),
                                const Spacer(),
                                IconButton(
                                  onPressed: () async {
                                    WidgetsBinding.instance
                                        .addPostFrameCallback((_) {
                                      final loginBloc =
                                          BlocProvider.of<LoginBloc>(context);
                                      loginBloc.add(LogoutButtonPressed());
                                      Navigator.pushNamedAndRemoveUntil(
                                          context,
                                          AppRoutes.shadowPage,
                                          (Route<dynamic> route) => false);
                                    });
                                  },
                                  icon: Icon(
                                    Icons.logout_rounded,
                                    size: 25,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onBackground
                                        .withOpacity(0.5),
                                  ),
                                ),
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
                                // const SizedBox(width: 20),
                                // CustomFilterButton()
                                //     .setOnPressed(() {})
                                //     .build(context),
                              ],
                            ),
                            ListView.builder(
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
                                        .setHarga(double.parse(
                                            laundryItem.hargaMulai.toString()))
                                        .setOnTap(() {
                                      _onLaundryItemTap(context, laundryItem.id);
                                    }).build(context),
                                    const SizedBox(height: 20),
                                  ],
                                );
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                }
                if (state is LaundryListFiltered) {
                  return Scaffold(
                    appBar: AppBar(
                      title: const Text("Hasil Pencarian"),
                      leading: IconButton(
                        icon: const Icon(Icons.arrow_back),
                        onPressed: () {
                          initializeData();
                        },
                      ),
                    ),
                    body: SingleChildScrollView(
                      child: Padding(
                        padding:
                            const EdgeInsets.only(left: 14, right: 14, top: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Hasil Pencarian",
                                style: TextStyle(
                                  fontFamily: 'Inter',
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                )),
                            ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: state.filteredLaundryList.length,
                              itemBuilder: (context, index) {
                                final laundryItem =
                                    state.filteredLaundryList[index];
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
                                        .setHarga(double.parse(
                                            laundryItem.hargaMulai.toString()))
                                        .setOnTap(() {
                                      _onLaundryItemTap(context, laundryItem.id);
                                    }).build(context),
                                    const SizedBox(height: 20),
                                  ],
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }
                if (state is LaundryListLoading) {
                  return const LaundryListShimmer();
                }
                if (state is LaundryListError) {
                  return Text(state.errorMessage);
                }
                return const Center(
                  child: Text("Tidak ada data!"),
                );
              },
            ),
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}

void _onLaundryItemTap(BuildContext context, int laundryId) async {
  final laundryListBloc = BlocProvider.of<LaundryDetailBloc>(context);
  final token = await UserPreferences.getToken();
  laundryListBloc
      .add(LaundryListItemClicked(token: token['token'], laundryId: laundryId));
  WidgetsBinding.instance.addPostFrameCallback((_) {
    Navigator.pushNamed(context, AppRoutes.userLaundryDetail);
  });
}

Future<void> getOrderHistory(BuildContext context) async {
  final laundryHistoryBloc = BlocProvider.of<LaundryHistoryBloc>(context);
  final token = await UserPreferences.getToken();
  laundryHistoryBloc.add(GetLaundryHistory(token: token['token']));
}