import 'package:WashWoosh/bloc/user/laundry_detail/laundry_detail_bloc.dart';
import 'package:WashWoosh/const/laundry_chooser_list.dart';
import 'package:WashWoosh/data/repositories/local/user_preferences.dart';
import 'package:WashWoosh/routes/routes.dart';
import 'package:WashWoosh/views/widgets/custom_button.dart';
import 'package:WashWoosh/views/widgets/custom_join_member_button.dart';
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
            print("Loading");
            return const Center(child: CircularProgressIndicator());
          } else if (state is LaundryDetailSuccess) {
            print("Sukses");
            return SingleChildScrollView(
                child: Padding(
              padding: const EdgeInsets.all(24),
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
                  LaundryChooserList(),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: CustomOutlinedButton()
                            .setLabel("Jam Operasional")
                            .setOnPressed(() {})
                            .build(context),
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
            ));
          } else if (state is LaundryDetailError) {
            print("Error");
            return const Center(
                child: Text("Terjadi kesalahan dalam pengambilan data"));
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

class LaundryChooserList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: laundryChooserList.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            LaundryDetailChooser()
                .setLaundryLabel(laundryChooserList[index].label)
                .setLaundryPrice(laundryChooserList[index].price),
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
  if (token != null) {
    laundryListBloc.add(
        LaundryJoinButtonClicked(token: token['token'], laundryId: laundryId));
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Navigator.pushReplacementNamed(context, AppRoutes.userLaundryList);
    });
  }
}
