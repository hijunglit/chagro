import 'package:flutter/material.dart';

class Book extends StatelessWidget {
  final Color bgColor;
  final String img;

  const Book({super.key, required this.bgColor, required this.img});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 15),
        child: Text(
          img,
          style: const TextStyle(fontSize: 16, color: Colors.white),
        ),
      ),
    );
  }
}
