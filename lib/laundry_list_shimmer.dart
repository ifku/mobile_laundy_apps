import 'package:WashWoosh/utils/get_screen_size.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LaundryListShimmer extends StatelessWidget {
  const LaundryListShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) {
        return Shimmer.fromColors(
          baseColor: Colors.grey.withOpacity(0.5),
          highlightColor: Colors.white,
          child: Container(
            height: 150,
            width: GetScreenSize.getScreenWidth(context),
            margin: const EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.grey.withOpacity(0.5),
            ),
          ),
        );
      },
    );
  }
}
