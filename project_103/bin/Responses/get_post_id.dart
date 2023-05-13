import 'dart:convert';
import 'dart:io';
import 'package:shelf/shelf.dart';

getPostByIdResponse(Request _, String id) async {
  try {
    File postsFile = File('posts.txt');
    final List content = await postsFile.readAsLines();

    List posts = [];
    for (String element in content) {
      posts.add(jsonDecode(element));
    }

    Map selectedPost = posts.firstWhere((element) => element["id"] == id);

    return Response.ok(
      json.encode(selectedPost),
      headers: {'Content-Type': 'Application/json'},
    );

    //return Response.forbidden("There is no id $id , please try again");
  } catch (error) {
    return Response.notFound("Error! Not found.");
  }
}
