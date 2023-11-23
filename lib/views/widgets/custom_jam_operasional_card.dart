import 'package:WashWoosh/bloc/user/laundry_jam_operasional/laundry_jam_operasional_bloc.dart';
import 'package:WashWoosh/bloc/user/laundry_jam_operasional/laundry_jam_operasional_bloc.dart';
import 'package:WashWoosh/utils/get_screen_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class CustomJamOperasionalCard extends StatelessWidget {
  String token;

  int laundryId;

  CustomJamOperasionalCard({
    super.key,
    required this.token,
    required this.laundryId,
  });

  @override
  Widget build(BuildContext context) {
    final List<String> hari = [
      "Senin",
      "Selasa",
      "Rabu",
      "Kamis",
      "Jumat",
      "Sabtu",
      "Minggu"
    ];
    final List<String> jamBuka = [];
    return BlocBuilder<LaundryJamOperasionalBloc, LaundryJamOperasionalState>(
      builder: (context, state) {
        if (state is LaundryJamOperasionalSuccess) {
          jamBuka.add(state.jamOperasionalData.jamOperasionalSenin);
          jamBuka.add(state.jamOperasionalData.jamOperasionalSelasa);
          jamBuka.add(state.jamOperasionalData.jamOperasionalRabu);
          jamBuka.add(state.jamOperasionalData.jamOperasionalKamis);
          jamBuka.add(state.jamOperasionalData.jamOperasionalJumat);
          jamBuka.add(state.jamOperasionalData.jamOperasionalSabtu);
          jamBuka.add(state.jamOperasionalData.jamOperasionalMinggu);
          return Center(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("Jam Operasional",
                            style: TextStyle(
                              fontFamily: "Lato",
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Theme.of(context).colorScheme.primary,
                            )),
                        const SizedBox(
                          height: 40,
                        ),
                        ListView.builder(
                          itemCount: hari.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (BuildContext context, int index) {
                            bool isToday = isTodayMatchingDay(hari[index]);

                            return Padding(
                              padding: const EdgeInsets.only(bottom: 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    hari[index],
                                    style: TextStyle(
                                      color: isToday
                                          ? Theme.of(context)
                                              .colorScheme
                                              .secondary
                                          : Theme.of(context)
                                              .colorScheme
                                              .onBackground
                                              .withOpacity(0.5),
                                    ),
                                  ),
                                  Text(
                                    jamBuka[index],
                                    style: TextStyle(
                                      color: isToday
                                          ? Theme.of(context)
                                              .colorScheme
                                              .secondary
                                          : Theme.of(context)
                                              .colorScheme
                                              .onBackground
                                              .withOpacity(0.5),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        )
                      ],
                    ),
                  ),
                )),
          ));
        } else if (state is LaundryJamOperasionalError) {
          return Center(
              child: SizedBox(
            width: GetScreenSize.getScreenWidth(context) * 0.9,
            height: GetScreenSize.getScreenHeight(context) * 0.5,
            child: Card(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: Center(child: Text(state.errorMessage))),
          ));
        }
        return const Center(child: Text("Terjadi kesalahan"));
      },
    );
  }
}

bool isTodayMatchingDay(String day) {
  DateTime now = DateTime.now();
  String today = DateFormat('EEEE', 'id_ID').format(now);

  return today == day;
}
