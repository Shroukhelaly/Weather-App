import 'package:flutter/material.dart';

class NoWeatherBody extends StatelessWidget {
  const NoWeatherBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'There is no weather 😔,Start',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w400,
            ),
          ),
          Text(
            'Searching now 🔍',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w400,
            ),
          )
        ],
      ),
    );
  }
}
