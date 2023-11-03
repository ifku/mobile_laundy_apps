import 'package:WashWoosh/dummy.dart';
import 'package:WashWoosh/laundry_list_shimmer.dart';
import 'package:flutter/material.dart';

class Dummy extends StatelessWidget {
  const Dummy({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              // LaundryListShimmer(),
            ],
          ),
        ),
      ),
    );
  }
}
