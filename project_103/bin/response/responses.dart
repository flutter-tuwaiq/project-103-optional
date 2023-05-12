import 'dart:convert';
import 'dart:io';
import 'package:shelf/shelf.dart';

Response rootHandler(Request _) {
  return Response.ok('server is working.');
}

Future<Response> findPostHandler(Request _, String id) async {
  try {
    File jsonFile = File('bin/posts.txt');
    final List posts = json.decode(await jsonFile.readAsString());
    final Map postMap = posts.firstWhere((post) => post["id"] == id);

    return Response.ok(
      json.encode(postMap),
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

    if (jsonBody.containsKey("id") &&
        jsonBody.containsKey("content") &&
        jsonBody.containsKey("name")) {
      posts.add(jsonBody);

      await jsonFile.writeAsString(json.encode(posts));

      return Response.ok(
        json.encode(jsonBody),
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

    posts.remove(postMap);

    await jsonFile.writeAsString(json.encode(posts));

    return Response.ok(
      json.encode(postMap),
      headers: {'Content-Type': 'Application/json'},
    );
  } catch (e) {
    print(e);

    return Response.notFound('Post not found!');
  }
}
