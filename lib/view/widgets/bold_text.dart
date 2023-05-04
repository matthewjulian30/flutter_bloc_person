import 'package:flutter/material.dart';

class BoldText extends StatelessWidget {
  final String teks;

  const BoldText({super.key, required this.teks});

  @override
  Widget build(BuildContext context) {
    return Text(
      teks,
      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
    );
  }
}
