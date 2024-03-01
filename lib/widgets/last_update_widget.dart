import 'package:flutter/material.dart';

class LastUpdateWidget extends StatelessWidget {
  const LastUpdateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "son güncelleme  ${const TimeOfDay(hour: 21, minute: 02).format(context)}", style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
    );
  }
}