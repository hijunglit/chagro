import 'package:chagro/models/book_model.dart';
import 'package:chagro/services/api_service.dart';
import 'package:chagro/widgets/book_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BookListScreen extends StatefulWidget {
  const BookListScreen({super.key});

  @override
  State<BookListScreen> createState() => _BookListScreenState();
}

class BooksProvider extends ChangeNotifier {
  final ApiService apiService;

  BooksProvider(this.apiService);

  List<BookModel> _books = [];
  BookStatus _selectedStatus = BookStatus.all;

  BookStatus get selectedStatus => _selectedStatus;

  bool _isLoading = false;

  List<BookModel> get books => _books;
  bool get isLoading => _isLoading;

  List<BookModel> get filteredBooks {
    // 바디에 null 이 리턴될텐데, 리턴 타입이 LIST<BookModel이다. 이것은 잠재적으로 null을 허용하지 않는 타입니다.>
    if (_selectedStatus == BookStatus.all) {
      return _books;
    } else {
      return _books.where((book) => book.status == _selectedStatus).toList();
    }
  }

  Future<void> fetchBooks() async {
    _isLoading = true;
    notifyListeners();

    _books = await apiService.getBooks();

    _isLoading = false;
    notifyListeners();
  }

  void changeStatusFilter(BookStatus status) {
    _selectedStatus = status;
    notifyListeners();
  }
}

extension BookStatusLabel on BookStatus {
  String get label {
    switch (this) {
      case BookStatus.all:
        return '전체';
      case BookStatus.queue:
        return '대기';
      case BookStatus.process:
        return '진행 중';
      case BookStatus.complete:
        return '완료';
    }
  }
}

class _BookListScreenState extends State<BookListScreen> {
  final ApiService apiService = ApiService();
  // late Future<List<BookModel>> _booksFuture;

  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      context.read<BooksProvider>().fetchBooks();
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<BooksProvider>();
    if (provider.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }
    final books = provider.filteredBooks;
    // for (var book in books) {
    //   print(book.coverUrl);
    // }
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
                    DropdownButton<BookStatus>(
                      value: provider._selectedStatus,
                      items: BookStatus.values.map((status) {
                        return DropdownMenuItem<BookStatus>(
                          value: status,
                          child: Text(status.label),
                        );
                      }).toList(),
                      onChanged: (BookStatus? value) {
                        if (value == null) return;
                        context.read<BooksProvider>().changeStatusFilter(value);
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 30,
                mainAxisSpacing: 22,
                childAspectRatio: 0.7,
              ),
              itemCount: provider._selectedStatus == BookStatus.all
                  ? books.length + 1
                  : books.length,
              itemBuilder: (context, index) {
                if (provider._selectedStatus == BookStatus.all &&
                    index == books.length) {
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
                    status: book.status,
                  );
                }
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
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
}

// 책 상태 필터링
// 더 보기 메뉴에서 보고싶은 상태를 터치한다. (팝업 메뉴) O
// 선택한 상태로 상태명이 바뀐다.
// 선택한 상태에 부합하는 책들이 디스플레이 된다.

// 상태 필터링 메소드
// 데이터에 Enum 값 추가(읽을 예정, 읽는중, 완독) O
// case 문을 이용해 필터링된 책의 값을 할당하기
// 필터링 된 책 display 하기
