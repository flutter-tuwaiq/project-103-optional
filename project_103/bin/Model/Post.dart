class Post {
  String? id;
  String? name;
  String? content;

  Post({this.id, this.name, this.content});

  factory Post.fromJson({required Map json}) {
    return Post(
      id: json["id"],
      name: json["name"],
      content: json["content"],
    );
  }

  Map toMap() {
    return {
      "id": id,
      "name": name,
      "content": content,
    };
  }
}
