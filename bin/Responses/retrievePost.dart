import 'dart:convert';
import 'dart:io';

import 'package:shelf/shelf.dart';

import '../Models/Post.dart';

retrievePost(Request _, String id) async {
  try {
    File file = File("posts.txt");
    final lines = await file.readAsLines();

    final posts =
        lines.map(((line) => Post.fromMap(json.decode(line)))).toList();

    final post = posts.firstWhere((element) => element.id == id);

    return Response.ok(json.encode(post.toMap()),
        headers: {"Content-Type": "Application/json"},);
  } catch (e) {
    return Response.notFound("Sorry post not found.");
  }
}
