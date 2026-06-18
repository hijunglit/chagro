import 'package:chagro/models/book_model.dart';
import 'package:chagro/screens/detail_screen.dart';
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
  final BookStatus status;

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
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailScreen(
              id: id,
              title: title,
              author: author,
              coverUrl: coverUrl,
              summary: summary,
              tags: tags,
              totalPages: totalPages,
              rating: rating,
              memo: memo,
              status: status,
            ),
          ),
        );
      },
      child: Column(
        children: [
          Container(
            width: 250,
            height: 110,

            decoration: BoxDecoration(borderRadius: BorderRadius.circular(4)),
            child: Image.network(coverUrl),
          ),
          Text(
            title,
            style: const TextStyle(fontSize: 12),
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
