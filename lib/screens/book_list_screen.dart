import 'package:chagro/models/book_model.dart';
import 'package:chagro/services/api_service.dart';
import 'package:chagro/widgets/book_widget.dart';
import 'package:flutter/material.dart';

class BookListScreen extends StatefulWidget {
  const BookListScreen({super.key});

  @override
  State<BookListScreen> createState() => _BookListScreenState();
}

class _BookListScreenState extends State<BookListScreen> {
  final ApiService _apiService = ApiService();
  late Future<List<BookModel>> _booksFuture;

  @override
  void initState() {
    super.initState();
    _booksFuture = _apiService.getBooks();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<BookModel>>(
      future: _booksFuture,
      builder: (context, snapshot) {
        // 1. Loading state
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        // 2. Error handling state
        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }
        if (snapshot.hasData && snapshot.data!.isNotEmpty) {
          final books = snapshot.data!;
          final totalBooks = books.length;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                const Row(children: [SizedBox(height: 60)]),
                const Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [Icon(Icons.settings, size: 30)],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Icon(Icons.logo_dev, size: 70)],
                    ),
                  ],
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            '전체',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              final RenderBox renderBox =
                                  context.findRenderObject() as RenderBox;
                              final offset = renderBox.localToGlobal(
                                Offset.zero,
                              );

                              showMenu(
                                context: context,
                                position: RelativeRect.fromLTRB(
                                  offset.dx + renderBox.size.width,
                                  offset.dy,
                                  offset.dx + renderBox.size.width,
                                  offset.dy,
                                ),
                                items: [
                                  const PopupMenuItem(
                                    value: 'queue',
                                    child: Text('예정'),
                                  ),
                                  const PopupMenuItem(
                                    value: 'reading',
                                    child: Text('읽는 중'),
                                  ),
                                  const PopupMenuItem(
                                    value: 'complete',
                                    child: Text('완독'),
                                  ),
                                ],
                              );
                            },
                            icon: const Icon(Icons.more_horiz_rounded),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 30,
                          mainAxisSpacing: 22,
                          childAspectRatio: 0.7,
                        ),
                    itemCount: books.length + 1,
                    itemBuilder: (context, index) {
                      if (index == books.length) {
                        return const Center(
                          child: Icon(Icons.add, color: Colors.black, size: 44),
                        );
                      } else {
                        final book = books[index];
                        return Book(
                          id: book.id,
                          title: book.title,
                          author: book.author,
                          coverUrl: book.coverUrl,
                          summary: book.summary,
                          tags: book.tags.join(),
                          totalPages: book.totalPages.toString(),
                          rating: book.rating.toString(),
                          memo: book.memo,
                        );
                      }
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 20,
                  ),
                  child: Row(
                    children: [
                      Text(
                        '등록된 책: $totalBooks 권',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }
        return const Text('Loading...');
      },
    );
  }
}

// 책 상태 필터링
// 더 보기 메뉴에서 보고싶은 상태를 터치한다. (팝업 메뉴) O
// 선택한 상태로 상태명이 바뀐다.
// 선택한 상태에 부합하는 책들이 디스플레이 된다.

// 상태 필터링 메소드
// 데이터에 Enum 값 추가(읽을 예정, 읽는중, 완독)
// case 문을 이용해 필터링된 책의 값을 할당하기
// 필터링 된 책 display 하기
