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
    return Scaffold(
      backgroundColor: const Color(0xFFF2ECDD),
      body: FutureBuilder<List<BookModel>>(
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

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: [
                  const Row(children: [SizedBox(height: 80)]),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Icon(Icons.logo_dev, size: 100)],
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
                            child: Icon(
                              Icons.add,
                              color: Colors.black,
                              size: 44,
                            ),
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
                  const Row(children: [Text('현재 책 개수: {}')]),
                ],
              ),
            );
          }
          return const Text('Loading...');
        },
      ),
    );
  }
}
