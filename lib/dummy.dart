import 'package:flutter/material.dart';
import 'package:mobile_laundy_apps/views/widgets/laundry_detail_chooser.dart';

class Dummy extends StatelessWidget {
  const Dummy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            const Padding(padding: EdgeInsets.only(top: 70)),
            Image.asset('lib/assets/images/rectangle.png'),
            const Padding(padding: EdgeInsets.all(10)),
            Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
              style: TextStyle(
                  color: Theme.of(context)
                      .colorScheme
                      .onBackground
                      .withOpacity(0.5)),
            ),
            Center(child: LaundryDetailChooser()),
          ],
        ),
      ),
    );
  }
}
