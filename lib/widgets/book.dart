import 'package:flutter/material.dart';

class Book extends StatelessWidget {
  final Color bgColor;
  final String img;

  const Book({super.key, required this.bgColor, required this.img});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("Take me there");
      },
      child: Container(
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Text(
          img,
          style: const TextStyle(fontSize: 16, color: Colors.white),
        ),
      ),
    );
  }
}
