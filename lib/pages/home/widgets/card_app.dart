import 'package:flutter/material.dart';

class CardApp extends StatelessWidget {
  const CardApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(5))),
    );
  }
}
