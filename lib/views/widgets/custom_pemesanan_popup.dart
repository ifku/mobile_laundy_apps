import 'package:WashWoosh/bloc/mitra/mitra_dashboard/mitra_dashboard_bloc.dart';
import 'package:WashWoosh/data/models/mitra/mitra_laundry_membership_model.dart';
import 'package:WashWoosh/data/models/mitra/mitra_membership_request_model.dart';
import 'package:WashWoosh/data/repositories/local/user_preferences.dart';
import 'package:WashWoosh/utils/get_screen_size.dart';
import 'package:WashWoosh/views/widgets/custom_button.dart';
import 'package:WashWoosh/views/widgets/custom_input_field.dart';
import 'package:WashWoosh/views/widgets/custom_switcher_with_text.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomPemesananPopup extends StatefulWidget {
  final void Function(DateTime) onDateSelected;
  final List<MitraLaundryMembershipData> namaMember;

  const CustomPemesananPopup({
    super.key,
    required this.onDateSelected,
    required this.namaMember,
  });

  @override
  _CustomPemesananPopupState createState() => _CustomPemesananPopupState();
}

class _CustomPemesananPopupState extends State<CustomPemesananPopup> {
  TextEditingController? _priceController;
  TextEditingController? _doneEstimationController;
  String? selectedValue;
  MitraMembershipRequestModel? mitraMembershipRequestModel;
  bool isDibayar = false;

  @override
  void initState() {
    super.initState();
    _priceController = TextEditingController();
    _doneEstimationController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
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
              children: [
                Text(
                  "Form Pemesanan",
                  style: TextStyle(
                    fontFamily: "Lato",
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  "Mohon untuk mengisi data dibawah ini dengan benar",
                  style: TextStyle(
                    fontFamily: "Lato",
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Theme.of(context)
                        .colorScheme
                        .onBackground
                        .withOpacity(0.3),
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                DropdownButtonFormField2<String>(
                  isExpanded: true,
                  hint: const Text("Pilih Nama Member"),
                  decoration: const InputDecoration(
                      // ...
                      ),
                  items: widget.namaMember
                      .map((item) => DropdownMenuItem<String>(
                            value: item.userId,
                            child: Text(
                              item.nama,
                              style: const TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ))
                      .toList(),
                  onChanged: (String? value) {
                    if (value != null) {
                      setState(() {
                        selectedValue = value;
                      });
                    }
                  },
                  onSaved: (value) {
                    if (value != null) {
                      setState(() {
                        selectedValue = value;
                      });
                    }
                  },
                ),
                const SizedBox(height: 15),
                CustomInputField()
                    .setLabel("Harga")
                    .setController(_priceController!)
                    .setKeyboardType(TextInputType.number)
                    .setIcon(const Icon(Icons.money))
                    .setSizedBoxHeight(15)
                    .build(context),
                GestureDetector(
                  onTap: () {
                    _selectDate(context);
                  },
                  child: AbsorbPointer(
                    absorbing: true,
                    child: CustomInputField()
                        .setLabel("Estimasi Selesai")
                        .setController(_doneEstimationController!)
                        .setIcon(const Icon(Icons.calendar_month_outlined))
                        .build(context),
                  ),
                ),
                BlocBuilder<MitraActionBloc, MitraActionState>(
                  builder: (context, state) {
                    if (state is SwitchToggledState) {
                      isDibayar = state.isSwitchOn;
                      return CustomSwitcherWithText(
                        value: state.isSwitchOn,
                        onSwitch: (value) {
                          BlocProvider.of<MitraActionBloc>(context)
                              .add(ToggleSwitchClicked(isSwitchOn: value));
                        },
                      );
                    }
                    return Container();
                  },
                ),
                CustomButton().setLabel("Tambah Pesanan").setOnPressed(() {
                  mitraMembershipRequestModel = MitraMembershipRequestModel(
                      harga: _priceController!.text,
                      estimasiTanggalSelesai: _doneEstimationController!.text,
                      customerId: selectedValue.toString(),
                      statusPemesananId: "1",
                      isDibayar: isDibayar);
                  addOrder(mitraMembershipRequestModel);
                  _priceController?.clear();
                  _doneEstimationController?.clear();
                  Navigator.pop(context);
                }).build(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = (await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    ))!;
    setState(() {
      _doneEstimationController!.text = picked.toLocal().toString();
      widget.onDateSelected(picked);
    });
    }

  Future<void> addOrder(
      MitraMembershipRequestModel? mitraMembershipRequestModel) async {
    final addOrderBloc = BlocProvider.of<MitraDashboardBloc>(context);
    final token = await UserPreferences.getToken();
    addOrderBloc.add(AddOrderClicked(
        token: token['token'],
        mitraMembershipRequestModel: mitraMembershipRequestModel));
  }
}
