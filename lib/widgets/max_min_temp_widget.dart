import 'package:flutter/material.dart';

class MaxMinTemperatureWidget extends StatelessWidget {
  const MaxMinTemperatureWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text("Maximum ${25} ℃", style: TextStyle(fontSize: 20),),
        Text("Minimum ${6} ℃", style: TextStyle(fontSize: 20),)
      ],
    );
  }
}