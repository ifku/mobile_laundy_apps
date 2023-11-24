import 'package:WashWoosh/bloc/user/laundry_detail/laundry_detail_bloc.dart';
import 'package:WashWoosh/bloc/user/laundry_jam_operasional/laundry_jam_operasional_bloc.dart';
import 'package:WashWoosh/const/laundry_chooser_list.dart';
import 'package:WashWoosh/data/repositories/local/user_preferences.dart';
import 'package:WashWoosh/dummy.dart';
import 'package:WashWoosh/routes/routes.dart';
import 'package:WashWoosh/views/widgets/custom_jam_operasional_card.dart';
import 'package:WashWoosh/views/widgets/custom_join_member_button.dart';
import 'package:WashWoosh/views/widgets/custom_loading.dart';
import 'package:WashWoosh/views/widgets/custom_outlined_button.dart';
import 'package:WashWoosh/views/widgets/laundry_detail_chooser.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserLaundryDetail extends StatefulWidget {
  const UserLaundryDetail({super.key});

  @override
  State<UserLaundryDetail> createState() => _UserLaundryDetailState();
}

class _UserLaundryDetailState extends State<UserLaundryDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<LaundryDetailBloc, LaundryDetailState>(
        builder: (context, state) {
          if (state is LaundryDetailLoading) {
            return const CustomLoading();
          } else if (state is LaundryDetailSuccess) {
            return Scaffold(
              appBar: AppBar(
                title: Text(
                  state.laundryDetailData.nama,
                  style: const TextStyle(fontSize: 18),
                ),
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              body: SingleChildScrollView(
                  child: Padding(
                padding: const EdgeInsets.only(bottom: 24, right: 24, left: 24),
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Text(
                        state.laundryDetailData.nama,
                        style: const TextStyle(
                            fontFamily: "Lato",
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        'lib/assets/images/laundry_dummy.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      state.laundryDetailData.deskripsi,
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                          fontFamily: "Lato",
                          fontSize: 14,
                          color: Theme.of(context)
                              .colorScheme
                              .onBackground
                              .withOpacity(0.3)),
                    ),
                    const SizedBox(height: 15),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Daftar Layanan",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Lato",
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    LaundryChooserList(
                      prices: [
                        state.laundryDetailData.hargaRapi,
                        state.laundryDetailData.hargaKering,
                        state.laundryDetailData.hargaBasah,
                        state.laundryDetailData.hargaSatuan,
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: CustomOutlinedButton()
                              .setLabel("Jam Operasional")
                              .setOnPressed(() {
                            _onJamOperasionalTapped(
                                context, state.laundryDetailData.id);
                          }).build(context),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: CustomJoinMemberButton()
                              .setLabel("Gabung Disini")
                              .setIsActive(state.laundryDetailData.isJoined)
                              .setOnPressed(() {
                            _onJoinMembershipTapped(
                                context, state.laundryDetailData.id);
                          }).build(context),
                        ),
                      ],
                    ),
                  ],
                ),
              )),
            );
          } else if (state is LaundryDetailError) {
            return Center(child: Text(state.errorMessage));
          }
          return const CustomLoading();
        },
      ),
    );
  }
}

class LaundryChooserList extends StatelessWidget {
  final List<int> prices;

  const LaundryChooserList({
    Key? key,
    required this.prices,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: prices.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            LaundryDetailChooser()
                .setLaundryLabel(laundryChooserList[index].label)
                .setLaundryPrice(prices[index].toDouble()),
            const SizedBox(height: 10)
          ],
        );
      },
    );
  }
}

void _onJoinMembershipTapped(BuildContext context, int laundryId) async {
  final laundryListBloc = BlocProvider.of<LaundryDetailBloc>(context);
  final token = await UserPreferences.getToken();
  laundryListBloc.add(
      LaundryJoinButtonClicked(token: token['token'], laundryId: laundryId));
  WidgetsBinding.instance.addPostFrameCallback((_) {
    Navigator.pushReplacementNamed(context, AppRoutes.userLaundryList);
  });
}

void _onJamOperasionalTapped(BuildContext context, int laundryId) async {
  final laundryListBloc = BlocProvider.of<LaundryJamOperasionalBloc>(context);
  final token = await UserPreferences.getToken();
  laundryListBloc.add(
      LaundryGetJamOperasional(token: token['token'], laundryId: laundryId));
  WidgetsBinding.instance.addPostFrameCallback((_) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return CustomJamOperasionalCard(
            token: token['token'],
            laundryId: laundryId,
          );
        });
  });
}
