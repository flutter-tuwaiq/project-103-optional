import 'dart:convert';
import 'dart:io';
import 'package:shelf/shelf.dart';
import '../models/post.dart';

Response rootHandler(Request _) {
  return Response.ok('server is working.');
}

Future<Response> findPostHandler(Request _, String id) async {
  try {
    File jsonFile = File('bin/posts.txt');
    final List posts = json.decode(await jsonFile.readAsString());
    final Map postMap = posts.firstWhere((post) => post["id"] == id);
    final Post post = Post.fromJson(postMap);

    return Response.ok(
      json.encode(post.toMap()),
      headers: {'Content-Type': 'Application/json'},
    );
  } catch (e) {
    print(e);

    return Response.notFound('Post not found!');
  }
}

Future<Response> createPostHandler(Request req) async {
  try {
    await File('bin/posts.txt').create(recursive: true);

    File jsonFile = File('bin/posts.txt');
    List posts = [];

    String jsonString = await jsonFile.readAsString();

    if (jsonString != "") {
      posts = json.decode(jsonString);
    }

    final body = await req.readAsString();
    final Map jsonBody = json.decode(body);
    var postKeys = jsonBody.keys.toString();

    final Post post = Post.fromJson(jsonBody);

    if (postKeys == "(id, content, name)") {
      posts.add(post.toMap());

      await jsonFile.writeAsString(json.encode(posts));

      return Response.ok(
        json.encode(post.toMap()),
        headers: {'Content-Type': 'Application/json'},
      );
    } else {
      return Response.badRequest(body: "Invalid input!");
    }
  } catch (e) {
    print(e);

    return Response.notFound('Something went wrong!');
  }
}

Future<Response> deletePostHandler(Request _, String id) async {
  try {
    File jsonFile = File('bin/posts.txt');
    final List posts = json.decode(await jsonFile.readAsString());
    final Map postMap = posts.firstWhere((post) => post["id"] == id);
    final Post post = Post.fromJson(postMap);
    final postAsMap = post.toMap();

    posts.remove(postAsMap);

    await jsonFile.writeAsString(json.encode(posts));

    return Response.ok(
      json.encode(postAsMap),
      headers: {'Content-Type': 'Application/json'},
    );
  } catch (e) {
    print(e);

    return Response.notFound('Post not found!');
  }
}
