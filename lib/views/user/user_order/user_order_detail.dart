import 'package:WashWoosh/bloc/user/laundry_history_detail/laundry_history_detail_bloc.dart';
import 'package:WashWoosh/views/widgets/custom_detail.dart';
import 'package:WashWoosh/views/widgets/custom_user_order_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserOrderDetail extends StatefulWidget {
  const UserOrderDetail({super.key});

  @override
  State<UserOrderDetail> createState() => _UserOrderDetail();
}

class _UserOrderDetail extends State<UserOrderDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<LaundryHistoryDetailBloc, LaundryHistoryDetailState>(
        builder: (context, state) {
          if (state is LaundryHistoryDetailSuccess) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(top: 50, left: 10, right: 10),
                child: Column(
                  children: [
                    Text(
                      'Details Pesanan ID#${state.laundryDetailData.data.id}',
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
                          state.laundryDetailData.data.tanggalPesan.toString(),
                      estimasiPemesanan: state
                          .laundryDetailData.data.estimasiTanggalSelesai
                          .toString(),
                      hargaTotal: state.laundryDetailData.data.harga.toDouble(),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomUserOrderStatus(
                        orderId: state.laundryDetailData.data.id,
                        currentStatus:
                        state.laundryDetailData.data.statusPemesananId)
                  ],
                ),
              ),
            );
          }
          if (state is LaundryHistoryDetailLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is LaundryHistoryDetailFailure){
            return Center(
              child: Text(state.errorMessage),
            );
          }
          return const Center(
            child: Text("Tidak ada data!"),
          );
        },
      ),
    );
  }
}
