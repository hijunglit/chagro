class BookModel {
  final String id;
  final String title;
  final String author;
  final String coverUrl;
  final String summary;
  final List<dynamic> tags;
  final int totalPages;
  final double rating;
  final String memo;

  BookModel({
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

  factory BookModel.fromJson(Map<String, dynamic> json) {
    return BookModel(
      id: json['id'] as String,
      title: json['title'] as String,
      author: json['author'] as String,
      coverUrl: json['coverUrl'] as String,
      summary: json['summary'] as String,
      tags: json['tags'] as List<dynamic>,
      totalPages: json['totalPages'] as int,
      rating: json['rating'] as double,
      memo: json['memo'] as String,
    );
  }
}
