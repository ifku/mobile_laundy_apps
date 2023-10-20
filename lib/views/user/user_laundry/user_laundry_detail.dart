import 'package:flutter/material.dart';
import 'package:mobile_laundy_apps/const/constants.dart';
import 'package:mobile_laundy_apps/const/laundry_chooser_list.dart';
import 'package:mobile_laundy_apps/views/widgets/custom_button.dart';
import 'package:mobile_laundy_apps/views/widgets/custom_outlined_button.dart';
import 'package:mobile_laundy_apps/views/widgets/laundry_detail_chooser.dart';

class UserLaundryDetail extends StatefulWidget {
  const UserLaundryDetail({super.key});

  @override
  State<UserLaundryDetail> createState() => _UserLaundryDetailState();
}

class _UserLaundryDetailState extends State<UserLaundryDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const Align(
              alignment: Alignment.topCenter,
              child: Text(
                "Laundry Mart",
                style: TextStyle(
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
              Constants.loremIpsum,
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontFamily: "Lato",
                fontSize: 14,
                color: Theme.of(context).colorScheme.onBackground.withOpacity(0.3)
              ),
            ),
            const SizedBox(height: 15),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Daftar Pelayanan",
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
                  child: CustomButton()
                      .setLabel("Laundry Disini")
                      .setOnPressed(() {})
                      .build(context),
                ),
              ],
            ),
          ],
        ),
      )),
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
