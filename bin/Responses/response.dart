import 'dart:convert';
import 'dart:io';

import 'package:shelf/shelf.dart';

import '../Models/post.dart';

List posts = [];

// __________________ POST: Add Post _________________________
addPostResponse(Request req) async {
  try {
    File myfile = File("posts.txt");
    Map body = json.decode(await req.readAsString());

    posts.add(body);
    myfile.writeAsString(json.encode(posts));

    return Response.ok("post added successfully...");
  } catch (error) {
    return Response.notFound('post not found');
  }
}

prinntUniversalResponse(Request _) {
  return Response.ok('Hello\n');
}

// __________________ GET: Display By ID _________________________
displayByIdResponse(Request _, String id) async {
  try {
    File myfile = File("posts.txt");
    final List content = json.decode(await myfile.readAsString());
    List<Post> userInfo = [];

    for (var item in content) {
      userInfo.add(Post.fromJson(json: item));
    }

    Post selectedUser = userInfo.firstWhere((item) => item.id == id);

    return Response.ok(
      json.encode(selectedUser.toMap()),
      headers: {'Content-Type': 'Application/json'},
    );
  } catch (error) {
    return Response.notFound("Id not found, please enter a correct ID");
  }
}

// __________________ DELETE: Delete By ID _________________________
deleteByIdResponse(Request _, String id) async {
  try {
    File myfile = File("posts.txt");
    List content = json.decode(await myfile.readAsString());
    List<Post> userInfo = [];
    List newContent = [];
    for (var item in content) {
      userInfo.add(Post.fromJson(json: item));
    }

    Post deletedUser = userInfo.firstWhere((item) => item.id == id);
    // ignore: unnecessary_null_comparison
    if (deletedUser != null) {
      for (var map in userInfo) {
        if (map.id != id) {
          newContent.add(map.toMap());
        }
      }
      await myfile.writeAsString(json.encode(newContent));

      return Response.ok("User Deleted successfully...");
    }
  } catch (error) {
    return Response.notFound("the user isn't found, please enter a correct id");
  }
}
