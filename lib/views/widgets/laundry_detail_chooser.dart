import 'package:flutter/material.dart';
import 'package:mobile_laundy_apps/utils/get_screen_size.dart';

class LaundryDetailChooser extends StatelessWidget {
  const LaundryDetailChooser({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: GetScreenSize.getScreenWidth(context),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
            color: Theme.of(context).colorScheme.primary.withOpacity(0.3),
            width: 1.5),
        color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Cuci Kering",
                style: TextStyle(
                  color: Theme.of(context)
                      .colorScheme
                      .onBackground
                      .withOpacity(0.5),
                  fontWeight: FontWeight.w500,
                  fontFamily: "Lato",
                )),
            Text("Rp. 5.000/kg",
                style: TextStyle(
                  color: Theme.of(context)
                      .colorScheme
                      .onBackground
                      .withOpacity(0.5),
                  fontWeight: FontWeight.w500,
                  fontFamily: "Lato",
                )),
          ],
        ),
      ),
    );
  }
}
