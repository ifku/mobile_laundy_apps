import 'package:flutter/material.dart';
import 'package:mobile_laundy_apps/const/laundry_list.dart';
import 'package:mobile_laundy_apps/views/widgets/laundry_list_container.dart';

class LaundryList extends StatelessWidget {
  const LaundryList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
          child: Column(
            children: [
              LaundryListView(),
            ],
          ),
        ),
      ),
    );
  }
}

class LaundryListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: laundryList.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            LaundryListContainer()
                .setImageLaundry(laundryList[index].imageLaundry)
                .setNamaLaundry(laundryList[index].namaLaundry)
                .setAlamatLaundry(laundryList[index].alamatLaundry)
                .setJam(laundryList[index].jam)
                .setHarga(laundryList[index].harga.toDouble())
                .setOnTap(() {
              print("tes" + laundryList[index].namaLaundry);
            }).build(context),
            const SizedBox(height: 20)
          ],
        );
      },
    );
  }
}
