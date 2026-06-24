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
      body: Padding(
        padding: const EdgeInsetsGeometry.symmetric(
          vertical: 8,
          horizontal: 20,
        ),
        child: Column(
          spacing: 30,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  width: 120,
                  child: Image.network(coverUrl),
                ),
                const SizedBox(width: 14),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 6,
                      children: [
                        Text(
                          title,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(author),
                        Row(children: [Text(totalPages), const Text(' 페이지')]),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.5,
                          child: Text(summary),
                        ),
                        // 책 내용 줄바꿈 처리 필요
                        // overflow 처리 필요
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('책 상태'),
                DropdownButton(
                  value: '예정',
                  items: ['예정', '읽는 중', '완독'].map((value) {
                    return DropdownMenuItem(value: value, child: Text(value));
                  }).toList(),
                  onChanged: (value) {},
                ),
              ],
            ), // 책 상태를 반영한 드롭다운 메뉴 필요. 드롭다운 메뉴를 변경하면 상태가 변경되어야 함.
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text('메모'), Text('전체 보기 >')],
            ),
          ],
        ),
      ),
    );
  }
}
