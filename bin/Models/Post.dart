class Post {
  String? id;
  String? content;
  String? name;

  Post({this.id, this.content, this.name});

  factory Post.fromMap(Map json) {
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
