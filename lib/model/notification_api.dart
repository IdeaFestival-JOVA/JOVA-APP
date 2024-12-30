class Notification_model{

  final int id;
  final String title;
  final String content;
  final String createdAt;
  final String author;


  Notification_model({
    required this.id,
    required this.title,
    required this.content,
    required this.createdAt,
    required this.author
  });

  factory Notification_model.fromJson(Map<String,dynamic> json){
      return Notification_model(
        id: json['id'],
        title: json['title'],
        content: json['content'],
        createdAt: json['createdAt'],
        author: json['author'],
      );
  }

}