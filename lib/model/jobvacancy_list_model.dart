class Jobvacancy{

  final int? article;
  final String title;
  final String content;
  final String category;
  final String createdAt;

  Jobvacancy({
    required this.article,
    required this.title,
    required this.content,
    required this.category,
    required this.createdAt
  });

  factory Jobvacancy.fromJson(Map<String,dynamic> json){
    return Jobvacancy(
      article: json['article'],
      title: json['title'],
      content: json['content'],
      category: json['category'],
      createdAt: json['createdAt'],
    );
  }
}