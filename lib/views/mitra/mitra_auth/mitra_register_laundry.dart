import 'package:WashWoosh/bloc/auth/mitra_register/mitra_register_bloc.dart';
import 'package:WashWoosh/data/models/auth/mitra_data.dart';
import 'package:WashWoosh/data/models/auth/mitra_register_request_model.dart';
import 'package:WashWoosh/routes/routes.dart';
import 'package:WashWoosh/utils/get_screen_size.dart';
import 'package:WashWoosh/views/widgets/custom_button.dart';
import 'package:WashWoosh/views/widgets/custom_input_field.dart';
import 'package:WashWoosh/views/widgets/custom_text_area.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MitraRegisterLaundry extends StatefulWidget {
  final MitraData mitraData;

  const MitraRegisterLaundry({super.key, required this.mitraData});

  @override
  State<MitraRegisterLaundry> createState() => _MitraRegisterLaundryState();
}

class _MitraRegisterLaundryState extends State<MitraRegisterLaundry> {
  TextEditingController laundryNameController = TextEditingController();
  TextEditingController laundryAddressController = TextEditingController();
  TextEditingController laundryPhoneController = TextEditingController();
  TextEditingController laundryCuciRapi = TextEditingController();
  TextEditingController laundryCuciKering = TextEditingController();
  TextEditingController laundryCuciBasah = TextEditingController();
  TextEditingController laundryCuciSatuan = TextEditingController();
  TextEditingController laundryDescriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocConsumer<MitraRegisterBloc, MitraRegisterState>(
      listener: (context, state) {
        if (state is MitraRegisterSuccess) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            BlocProvider.of<MitraRegisterBloc>(context)
                .add(MitraRegisterReset());
            Navigator.of(context).pushNamedAndRemoveUntil(
                AppRoutes.shadowPage, (route) => false);
          });
        }
      },
      builder: (context, state) {
        if (state is MitraRegisterLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is MitraRegisterFailure) {
          return Center(child: Text("Gagal mendaftar ${state.error}"));
        }
        return SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                color: Theme.of(context).colorScheme.primary,
                height: GetScreenSize.getScreenHeight(context),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.85,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40)),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 36, left: 36, right: 36),
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Masukkan Data Laundry!",
                          style: TextStyle(
                              fontFamily: "Lato",
                              fontWeight: FontWeight.w700,
                              fontSize: 18,
                              color: Theme.of(context).colorScheme.primary),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          "Mohon isi semua kolom dengan benar",
                          style: TextStyle(
                              fontFamily: "Inter",
                              fontWeight: FontWeight.normal,
                              fontSize: 12,
                              color: Theme.of(context)
                                  .colorScheme
                                  .onBackground
                                  .withOpacity(0.5)),
                        ),
                        const SizedBox(height: 15),
                        CustomInputField()
                            .setController(laundryNameController)
                            .setLabel("Nama Laundry")
                            .setIcon(const Icon(Icons.home_outlined))
                            .setSizedBoxHeight(20)
                            .build(context),
                        CustomTextArea()
                            .setController(laundryAddressController)
                            .setSizedBoxHeight(20)
                            .setIcon(const Icon(Icons.location_on_outlined))
                            .setLabel("Alamat Laundry")
                            .build(context),
                        CustomInputField()
                            .setController(laundryPhoneController)
                            .setLabel("No. Telepon Laundry")
                            .setIcon(const Icon(Icons.call_outlined))
                            .setKeyboardType(TextInputType.phone)
                            .build(context),
                        BlocBuilder<MitraRegisterActionBloc,
                            MitraRegisterActionState>(
                          builder: (context, state) {
                            if (state is MitraExpandPrice) {
                              return ExpandablePanel(
                                controller: ExpandableController(
                                    initialExpanded: state.isExpanded),
                                collapsed: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text("Masukkan harga ?"),
                                    Switch(
                                      onChanged: (value) {
                                        BlocProvider.of<
                                                    MitraRegisterActionBloc>(
                                                context)
                                            .add(MitraPriceExpanded(
                                                isExpanded: value));
                                      },
                                      value: state.isExpanded,
                                    ),
                                  ],
                                ),
                                expanded: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text("Masukkan harga kamu"),
                                        Switch(
                                          onChanged: (value) {
                                            BlocProvider.of<
                                                        MitraRegisterActionBloc>(
                                                    context)
                                                .add(MitraPriceExpanded(
                                                    isExpanded: value));
                                          },
                                          value: state.isExpanded,
                                        ),
                                      ],
                                    ),
                                    CustomInputField()
                                        .setController(laundryCuciRapi)
                                        .setLabel("Harga Cuci Rapi")
                                        .setKeyboardType(
                                            TextInputType.numberWithOptions())
                                        .setIcon(const Icon(
                                            Icons.price_change_outlined))
                                        .setSizedBoxHeight(20)
                                        .build(context),
                                    CustomInputField()
                                        .setController(laundryCuciKering)
                                        .setLabel("Harga Cuci Kering")
                                        .setKeyboardType(
                                            TextInputType.numberWithOptions())
                                        .setIcon(const Icon(
                                            Icons.price_change_outlined))
                                        .setSizedBoxHeight(20)
                                        .build(context),
                                    CustomInputField()
                                        .setController(laundryCuciBasah)
                                        .setLabel("Harga Cuci Basah")
                                        .setKeyboardType(
                                            TextInputType.numberWithOptions())
                                        .setIcon(const Icon(
                                            Icons.price_change_outlined))
                                        .setSizedBoxHeight(20)
                                        .build(context),
                                    CustomInputField()
                                        .setController(laundryCuciSatuan)
                                        .setLabel("Harga Cuci Satuan")
                                        .setKeyboardType(TextInputType.number)
                                        .setIcon(const Icon(
                                            Icons.price_change_outlined))
                                        .setSizedBoxHeight(20)
                                        .build(context),
                                  ],
                                ),
                              );
                            }
                            return Container();
                          },
                        ),
                        CustomTextArea()
                            .setController(laundryDescriptionController)
                            .setSizedBoxHeight(20)
                            .setIcon(const Icon(Icons.short_text_rounded))
                            .setLabel("Deskripsi Laundry")
                            .build(context),
                        SizedBox(
                            width: GetScreenSize.getScreenWidth(context),
                            child:
                                CustomButton().setLabel("Daftar").setOnPressed(
                              () {
                                final mitraRegisterBloc =
                                    BlocProvider.of<MitraRegisterBloc>(context);
                                mitraRegisterBloc.add(
                                  MitraRegisterButtonPressed(
                                    mitraRegisterRequestModel:
                                        MitraRegisterRequestModel(
                                      nik: widget.mitraData.nik,
                                      nama: widget.mitraData.name,
                                      noHp: widget.mitraData.phone,
                                      rolesId: '3',
                                      email: widget.mitraData.email,
                                      username: widget.mitraData.username,
                                      password: widget.mitraData.password,
                                      passwordKonfirmasi:
                                          widget.mitraData.password,
                                      namaLaundry: laundryNameController.text,
                                      alamat: laundryAddressController.text,
                                      noTelepon: laundryPhoneController.text,
                                      deskripsi:
                                          laundryDescriptionController.text,
                                      hargaRapi:
                                          handleEmpty(laundryCuciRapi.text),
                                      hargaKering:
                                          handleEmpty(laundryCuciKering.text),
                                      hargaBasah:
                                          handleEmpty(laundryCuciBasah.text),
                                      hargaSatuan:
                                          handleEmpty(laundryCuciSatuan.text),
                                      gambar: "",
                                      jamBuka: "08:00 - 17.00",
                                    ),
                                  ),
                                );
                              },
                            ).build(context)),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 30,
                height: 104,
                width: 104,
                child: Image.asset("lib/assets/images/iron.png"),
              ),
            ],
          ),
        );
      },
    ));
  }
}

String handleEmpty(String value) {
  return value.isNotEmpty ? value : "-";
}
