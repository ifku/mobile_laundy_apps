import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_laundy_apps/bloc/user/laundry/laundry_list_bloc.dart';
import 'package:mobile_laundy_apps/data/repositories/local/user_preferences.dart';
import 'package:mobile_laundy_apps/utils/get_screen_size.dart';
import 'package:mobile_laundy_apps/views/auth/welcome.dart';

class Dummy extends StatefulWidget {
  const Dummy({super.key});

  @override
  State<Dummy> createState() => _DummyState();
}

class _DummyState extends State<Dummy> {
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
      laundryListBloc.add(GetLaundryList(token));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Container(
              color: Colors.grey,
            ),
            Padding(
              padding: const EdgeInsets.all(36.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child: Container(
                  height: GetScreenSize.getScreenHeight(context) * 0.5,
                  width: GetScreenSize.getScreenWidth(context),
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Form Pemesanan",
                            style: TextStyle(
                                fontFamily: "Lato",
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Theme.of(context).colorScheme.primary)),
                        const SizedBox(height: 10),
                        Text(
                            "Mohon untuk mengisi data dibawah ini dengan benar",
                            style: TextStyle(
                                fontFamily: "Lato",
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Theme.of(context)
                                    .colorScheme
                                    .onPrimary
                                    .withOpacity(0.5)),
                            textAlign: TextAlign.center)
                      ],
                    ),
                  ),
                ),
              ),
            ),
            ElevatedButton(
                onPressed: () async {
                  UserPreferences.removeToken();
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Welcome()));
                },
                child: Text("Logout"))
          ],
        ),
      ),
      // body: Padding(
      //   padding: const EdgeInsets.all(8.0),
      //   child: BlocBuilder<LaundryListBloc, LaundryListState>(
      //     builder: (context, state) {
      //       if (state is LaundryListLoading) {
      //         return const Center(child: CircularProgressIndicator());
      //       } else if (state is LaundryListSuccess) {
      //         return ListView.builder(
      //           itemCount: state.laundryList.length,
      //           itemBuilder: (context, index) {
      //             final laundryItem = state.laundryList[index];
      //             return LaundryListContainer()
      //                 .setNamaLaundry(laundryItem.nama)
      //                 .setAlamatLaundry(laundryItem.alamat)
      //                 .setHarga(laundryItem.hargaPerKilo.toDouble())
      //                 .setOnTap(() {})
      //                 .build(context);
      //           },
      //         );
      //       } else if (state is LaundryListError) {
      //         return Center(
      //           child: Text('Error: ${state.errorMessage}'),
      //         );
      //       } else {
      //         return Center(
      //           child: Text('Tidak ada data.'),
      //         );
      //       }
      //     },
      //   ),
      // ),
    );
  }
}
