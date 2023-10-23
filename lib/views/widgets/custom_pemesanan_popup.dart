import 'package:WashWoosh/utils/get_screen_size.dart';
import 'package:WashWoosh/views/widgets/custom_button.dart';
import 'package:WashWoosh/views/widgets/custom_input_field.dart';
import 'package:flutter/material.dart';

class CustomPemesananPopup extends StatelessWidget {
  const CustomPemesananPopup({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    TextEditingController _usernameController = TextEditingController();
    TextEditingController _priceController = TextEditingController();
    TextEditingController _doneEstimationController = TextEditingController();
    return ClipRRect(
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
              Text("Mohon untuk mengisi data dibawah ini dengan benar",
                  style: TextStyle(
                      fontFamily: "Lato",
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Theme.of(context)
                          .colorScheme
                          .onBackground
                          .withOpacity(0.3)),
                  textAlign: TextAlign.center),
              const SizedBox(height: 20),
              CustomInputField()
                  .setLabel("Username")
                  .setController(_usernameController)
                  .setIcon(const Icon(Icons.person_outline))
                  .setSizedBoxHeight(15)
                  .build(context),
              CustomInputField()
                  .setLabel("Harga")
                  .setController(_priceController)
                  .setIcon(const Icon(Icons.money))
                  .setSizedBoxHeight(15)
                  .build(context),
              CustomInputField()
                  .setLabel("Estimasi Selesai")
                  .setController(_doneEstimationController)
                  .setIcon(const Icon(Icons.calendar_today_outlined))
                  .setSizedBoxHeight(20)
                  .build(context),
              CustomButton()
                  .setLabel("Tambah Pesanan")
                  .setOnPressed(() {})
                  .build(context)
            ],
          ),
        ),
      ),
    );
  }
}
