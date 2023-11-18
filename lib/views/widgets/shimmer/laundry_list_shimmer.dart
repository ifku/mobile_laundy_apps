import 'package:WashWoosh/utils/get_screen_size.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LaundryListShimmer extends StatelessWidget {
  const LaundryListShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 50, left: 14, right: 14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Shimmer.fromColors(
                  baseColor: Colors.grey.withOpacity(0.5),
                  highlightColor: Colors.white,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Container(width: 45, height: 45, color: Colors.grey),
                  ),
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Shimmer.fromColors(
                      baseColor: Colors.grey.withOpacity(0.5),
                      highlightColor: Colors.white,
                      child: Container(
                        color: Colors.grey,
                        height: 15,
                        width: 75,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Shimmer.fromColors(
                      baseColor: Colors.grey.withOpacity(0.5),
                      highlightColor: Colors.white,
                      child: Container(
                        color: Colors.grey,
                        height: 15,
                        width: 150
                      ),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(height: 20),
            Shimmer.fromColors(
              baseColor: Colors.grey.withOpacity(0.5),
              highlightColor: Colors.white,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                    color: Colors.grey.withOpacity(0.5),
                    height: 50,
                    width: GetScreenSize.getScreenWidth(context)),
              ),
            ),
            ListView.builder(
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
            ),
          ],
        ),
      ),
    );
  }
}
