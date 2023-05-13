import 'dart:convert';
import 'dart:io';

import 'package:shelf/shelf.dart';

import '../Models/Post.dart';

deletePost(Request _, String id) async {
  try{
  File file = File("posts.txt");
  final lines = await file.readAsLines();

  final posts = lines.map((line) => Post.fromMap(json.decode(line))).toList();

  final post = posts.indexWhere((element) => element.id == id);

  posts.removeAt(post);

  await file.writeAsString(
      posts.map(((post) => json.encode(post.toMap()))).join("\n"),);
  
  return Response.ok("Post deleted successfully");
  } catch (e){
    return Response.internalServerError(body: "failed to delete post.");
  }
}
