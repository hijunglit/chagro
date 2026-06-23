import 'package:chagro/models/book_model.dart';
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
  final BookStatus status;

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
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2ECDD),
      appBar: AppBar(backgroundColor: const Color(0xFFF2ECDD)),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SizedBox(width: 120, child: Image.network(coverUrl)),
                ],
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Column(
                        children: [
                          Row(children: [Text(title)]),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Column(
                        children: [
                          Row(children: [Text(author)]),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Column(
                        children: [
                          Row(children: [const Text("페이지:"), Text(totalPages)]),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Column(
                        children: [
                          Row(
                            children: [
                              const Text("내용:"),
                              Text(summary, overflow: TextOverflow.ellipsis),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          const Row(children: [Text('책 상태 영역')]),
          const Row(children: [Text('책 메모 영역')]),
        ],
      ),
    );
  }
}
