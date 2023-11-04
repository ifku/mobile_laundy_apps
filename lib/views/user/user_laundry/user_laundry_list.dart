import 'dart:math';

import 'package:WashWoosh/bloc/auth/login/login_bloc.dart';
import 'package:WashWoosh/bloc/user/laundry/laundry_list_bloc.dart';
import 'package:WashWoosh/bloc/user/laundry_detail/laundry_detail_bloc.dart';
import 'package:WashWoosh/const/laundry_list.dart';
import 'package:WashWoosh/data/repositories/local/user_preferences.dart';
import 'package:WashWoosh/routes/routes.dart';
import 'package:WashWoosh/utils/truncate_text_ellipsis.dart';
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
                        .setImageProfile("lib/assets/images/avatar_dummy.png")
                        .setNameProfile("Mimin Laundry")
                        .setAddressProfile("Gebang Lor 73, Sukolilo, Surabaya")
                        .build(context)),
                const Spacer(),
                ElevatedButton(
                    onPressed: () async {
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        final loginBloc = BlocProvider.of<LoginBloc>(context);
                        loginBloc.add(LogoutButtonPressed());
                        Navigator.pushReplacementNamed(
                            context, AppRoutes.welcomeScreen);
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
                  return const Center(child: CircularProgressIndicator());
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
                              .setNamaLaundry(laundryItem.nama)
                              .setImageLaundry(
                                  laundryList[randomIndex].imageLaundry)
                              .setAlamatLaundry(
                                  TruncateTextWithEllipsis.truncateWithEllipsis(
                                      laundryItem.alamat, 20))
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
