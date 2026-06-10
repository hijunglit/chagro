import 'package:flutter/material.dart';

class Book extends StatelessWidget {
  final String id;
  final String title;
  final String author;
  final String coverUrl;
  final String summary;
  final String tags;
  final String totalPages;
  final String rating;
  final String memo;

  const Book({
    super.key,
    required this.id,
    required this.title,
    required this.author,
    required this.coverUrl,
    required this.summary,
    required this.tags,
    required this.totalPages,
    required this.rating,
    required this.memo,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("Clicked!");
      },
      child: Column(
        children: [
          Container(
            width: 250,

            decoration: BoxDecoration(borderRadius: BorderRadius.circular(4)),
            child: Image.network(coverUrl),
          ),
          Text(title),
        ],
      ),
    );
  }
}
