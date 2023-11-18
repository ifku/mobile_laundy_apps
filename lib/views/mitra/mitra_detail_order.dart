import 'package:WashWoosh/bloc/mitra/mitra_detail/mitra_detail_bloc.dart';
import 'package:WashWoosh/routes/routes.dart';
import 'package:WashWoosh/views/widgets/custom_detail.dart';
import 'package:WashWoosh/views/widgets/custom_order_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MitraDetailOrder extends StatefulWidget {
  const MitraDetailOrder({super.key});

  @override
  State<MitraDetailOrder> createState() => _MitraDetailOrder();
}

class _MitraDetailOrder extends State<MitraDetailOrder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<MitraDetailBloc, MitraDetailState>(
        listener: (context, state) {
          if (state is MitraChangeOrderStatusSuccess) {
            Navigator.pushNamed(context, AppRoutes.mitraDashboard);
            BlocProvider.of<MitraDetailBloc>(context)
                .add(ResetMitraDetailState());
          }
        },
        builder: (context, state) {
          if (state is MitraDetailSuccess) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(top: 50, left: 10, right: 10),
                child: Column(
                  children: [
                    Text(
                      'Details Pesanan ID#${state.mitraDetailData.data.id}',
                      style: const TextStyle(
                        fontSize: 18,
                        fontFamily: "Lato",
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomDetail(
                      tanggalPemesanan:
                          state.mitraDetailData.data.tanggalPesan.toString(),
                      estimasiPemesanan: state
                          .mitraDetailData.data.estimasiTanggalSelesai
                          .toString(),
                      hargaTotal: state.mitraDetailData.data.harga.toDouble(),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomOrderStatus(
                        orderId: state.mitraDetailData.data.id,
                        currentStatus:
                            state.mitraDetailData.data.statusPemesananId)
                  ],
                ),
              ),
            );
          }
          if (state is MitraDetailFailure){
            return Center(
              child: Text(state.errorMessage),
            );
          }
          if (state is MitraChangeOrderStatusLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if(state is MitraChangeOrderStatusFailure){
            return Center(
              child: Text(state.errorMessage),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
