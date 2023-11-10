import 'package:WashWoosh/bloc/mitra/mitra_detail/mitra_detail_bloc.dart';
import 'package:WashWoosh/data/repositories/local/user_preferences.dart';
import 'package:WashWoosh/routes/routes.dart';
import 'package:WashWoosh/utils/get_screen_size.dart';
import 'package:WashWoosh/views/widgets/custom_button.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MitraStatusChangePopup extends StatefulWidget {

  final int laundryId;
  final int currentStatus;

  MitraStatusChangePopup({
    required this.laundryId,
    required this.currentStatus,
  });

  @override
  _MitraStatusChangePopupState createState() => _MitraStatusChangePopupState();
}

class _MitraStatusChangePopupState extends State<MitraStatusChangePopup> {
  String selectedValue = "";

  @override
  Widget build(BuildContext context) {
    final List<String> status = [
      "Proses",
      "Selesai Dicuci",
      "Selesai Pemesanan",
    ];
    return Material(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: Container(
          height: GetScreenSize.getScreenHeight(context) * 0.5,
          width: GetScreenSize.getScreenWidth(context),
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.only(left: 24, right: 24, bottom: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Pilih Status Pemesanan",
                    style: TextStyle(
                        fontFamily: "Lato",
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).colorScheme.primary)),
                const SizedBox(height: 20),
                Text("Mohon untuk mengisi data dibawah ini dengan benar",
                    style: TextStyle(
                        fontFamily: "Lato",
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Theme.of(context)
                            .colorScheme
                            .onBackground
                            .withOpacity(0.3)),
                    textAlign: TextAlign.justify),
                const SizedBox(height: 30),
                DropdownButtonFormField2<String>(
                  isExpanded: true,
                  hint: const Text("Pilih Status Pemesanan"),
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 16),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                          color: Theme.of(context)
                              .colorScheme
                              .primary
                              .withOpacity(0.5)),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.primary),
                    ),
                  ),
                  items: status
                      .map((item) => DropdownMenuItem<String>(
                            value: item,
                            child: Text(
                              item,
                              style: const TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedValue = value.toString();
                    });
                  },
                ),
                const SizedBox(height: 30),
                CustomButton().setLabel("Ubah Status").setOnPressed(() {
                  selectedValue = checkStatus(selectedValue);
                  changeStatus(
                      context, widget.laundryId, int.parse(selectedValue));
                  // Navigator.pop(context);
                }).build(context)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void changeStatus(
    BuildContext context, int laundryId, int selectedValue) async {
  final token = await UserPreferences.getToken();
  final changeStatusBloc = BlocProvider.of<MitraDetailBloc>(context);
  changeStatusBloc.add(OrderStatusChanged(
      token: token['token']!, laundryId: laundryId, status: selectedValue));
  changeStatusBloc.stream.listen((state) {
    if (state is MitraChangeOrderStatusSuccess) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.pushReplacementNamed(context, AppRoutes.mitraDashboard);
      });
    }
  });
}

String checkStatus(String selectedValue) {
  if (selectedValue == "Proses") {
    return selectedValue = "1";
  } else if (selectedValue == "Selesai Dicuci") {
    selectedValue = "2";
  } else if (selectedValue == "Selesai Pemesanan") {
    selectedValue = "3";
  }
  return selectedValue;
}
