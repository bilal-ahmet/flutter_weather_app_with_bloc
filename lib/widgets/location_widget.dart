import 'package:flutter/material.dart';

class LocationWidget extends StatelessWidget {
  String city;
  LocationWidget({required this.city, super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      city.toString(), style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
    );
  }
}