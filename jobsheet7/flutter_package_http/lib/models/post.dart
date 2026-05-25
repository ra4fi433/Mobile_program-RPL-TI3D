class Post {
	final int id;
	final String title;
	final String body;

Post({required this.id, required this.title, this.body = ''});

factory Post.fromJson(Map<String, dynamic> json) {
  return Post(
  id: json['id'] ?? 0,
  title: json['title'] ?? '',
  body: json['body'] ?? '',
    );
  }


  // Added for PATCH/POST convenience
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'body': body,
    };
  }

  // Cleaner local update
  Post copyWith({
    int? id,
    String? title,
    String? body,
  }) {
    return Post(
      id: id ?? this.id,
      title: title ?? this.title,
      body: body ?? this.body,
    );
  }

}