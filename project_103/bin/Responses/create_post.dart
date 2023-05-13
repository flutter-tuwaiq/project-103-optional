import 'dart:convert';
import 'dart:io';

import 'package:shelf/shelf.dart';

import '../Model/Post.dart';

createPostResponse(Request req) async {
  try {
    final Map jsonBody = json.decode(await req.readAsString());
    Post post = Post.fromJson(json: jsonBody);

    File postsFile = File('posts.txt');

    // write the new post created by request of POST endpoint
    await postsFile.writeAsString(
      '${jsonEncode(post.toMap())}\n',
      mode: FileMode.append,
    );

    return Response.ok(
      "The new post has been added to posts.txt \n ${post.toMap()}",
      headers: {'Content-Type': 'Application/json'},
    );
  } catch (error) {
    return Response.notFound("error!");
  }
}
