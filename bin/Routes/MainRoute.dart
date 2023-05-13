import 'package:shelf_router/shelf_router.dart';

import '../Responses/createPosts.dart';
import '../Responses/deletePost.dart';
import '../Responses/retrievePost.dart';

class MainRoute{

  Router get handler{
    final router = Router()
    ..post('/posts', createPost)
    ..get("/posts/<id>", retrievePost)
    ..delete('/posts/<id>', deletePost);

    return router;
  }
}