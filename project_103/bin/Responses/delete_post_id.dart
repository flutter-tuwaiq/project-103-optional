import 'dart:convert';
import 'dart:io';

import 'package:shelf/shelf.dart';

deletePostByIdResponse(Request _, String id) async {
  try {
    File postsFile = File('posts.txt');
    final List content = await postsFile.readAsLines();

    List posts = [];
    for (String element in content) {
      posts.add(jsonDecode(element));
    }

    posts.removeWhere((element) => element["id"] == id);

    postsFile.writeAsStringSync('');

    for (var element in posts) {
      await postsFile.writeAsString(
        '${jsonEncode(element)}\n',
        mode: FileMode.append,
      );
    }

    return Response.ok(
      json.encode("The post has been deleted"),
      headers: {'Content-Type': 'Application/json'},
    );
  } catch (error) {
    return Response.notFound("Error! Not found.");
  }
}
