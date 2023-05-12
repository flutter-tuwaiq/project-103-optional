class Post {
  String? id, content, name;

  Post({
    required this.id,
    required this.content,
    required this.name,
  });

  factory Post.fromJson(Map json) {
    return Post(
      id: json["id"],
      content: json["content"],
      name: json["name"],
    );
  }

  toMap() {
    return {
      "id": id,
      "content": content,
      "name": name,
    };
  }
}
