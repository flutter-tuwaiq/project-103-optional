import 'dart:convert';
import 'dart:io';

import 'package:shelf/shelf.dart';

import '../Models/Post.dart';

createPost(Request req) async {
  try {
    File file = File("posts.txt");
    final body = await req.readAsString();
    final postData = json.decode(body);

    final allowedKeys = ['id', 'content', 'name'];

    // if add the the 3 KEYS and another Key , it will create a posts but will only accept the 3 keys: id, content, name
    // if you missed one of the 3 keys it will not create the post
    if (postData == null ||
        !postData.containsKey('id') ||
        postData['id'].runtimeType != String ||
        postData['id'].isEmpty ||
        !postData.containsKey('content') ||
        postData['content'].runtimeType != String ||
        postData['content'].isEmpty ||
        !postData.containsKey('name') ||
        postData['name'].runtimeType != String ||
        postData['name'].isEmpty) {
      return Response.badRequest(body: "Invalid post data");
    }

    final Post post = Post.fromMap(postData);

    await file.writeAsString(
      "${json.encode(post.toMap())}\n",
      mode: FileMode.append,
    );

    return Response.ok("Post created successfully.");
  } catch (e) {
    return Response.internalServerError(body: "failed to create post.");
  }
}
