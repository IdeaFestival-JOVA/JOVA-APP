class Jobvacancy{

  final int? article_id;
  final String title;
  final String content;
  final String category;
  final String createdAt;
  final String endsAt;
  final String author;

  Jobvacancy({
    required this.article_id,
    required this.title,
    required this.content,
    required this.category,
    required this.createdAt,
    required this.endsAt,
    required this.author,
  });

  factory Jobvacancy.fromJson(Map<String,dynamic> json){
    return Jobvacancy(
      article_id: json['article-id'],
      title: json['title'],
      content: json['content'],
      category: json['category'],
      createdAt: json['createdAt'],
      endsAt: json['endsAt'],
      author: json['author'],
    );
  }
}