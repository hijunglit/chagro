import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final String id;
  final String title;
  final String author;
  final String coverUrl;
  final String summary;
  final String tags;
  final String totalPages;
  final String rating;
  final String memo;

  const DetailScreen({
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
    return Scaffold(
      backgroundColor: const Color(0xFFF2ECDD),
      appBar: AppBar(backgroundColor: const Color(0xFFF2ECDD)),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [SizedBox(width: 250, child: Image.network(coverUrl))],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Row(children: [const Text("Title:"), Text(title)]),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Row(children: [const Text("Author:"), Text(author)]),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Row(children: [const Text("Total pages:"), Text(totalPages)]),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      const Text("summary:"),
                      Text(summary, overflow: TextOverflow.ellipsis),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
