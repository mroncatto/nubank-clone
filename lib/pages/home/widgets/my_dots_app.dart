import 'package:flutter/material.dart';

class MyDotsApp extends StatelessWidget {
  final int currentIndex;
  final double top;

  Color getColor(int index) {
    return index == currentIndex ? Colors.white : Colors.white38;
  }

  const MyDotsApp({super.key, required this.currentIndex, required this.top});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      child: Row(
        children: [
          AnimatedContainer(
            duration: Duration(milliseconds: 300),
            height: 7,
            width: 7,
            decoration:
                BoxDecoration(color: getColor(0), shape: BoxShape.circle),
          ),
          SizedBox(
            width: 8,
          ),
          AnimatedContainer(
            duration: Duration(milliseconds: 300),
            height: 7,
            width: 7,
            decoration:
                BoxDecoration(color: getColor(1), shape: BoxShape.circle),
          ),
          SizedBox(
            width: 8,
          ),
          AnimatedContainer(
            duration: Duration(milliseconds: 300),
            height: 7,
            width: 7,
            decoration:
                BoxDecoration(color: getColor(2), shape: BoxShape.circle),
          )
        ],
      ),
    );
  }
}
