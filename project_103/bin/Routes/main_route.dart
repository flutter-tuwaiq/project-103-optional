import 'package:shelf_router/shelf_router.dart';

import '../Responses/create_post.dart';
import '../Responses/delete_post_id.dart';
import '../Responses/get_post_id.dart';

class MainRoute {
  Router get myMainRoute {
    final router = Router()
      ..post('/posts', createPostResponse)
      ..get('/posts/<id>', getPostByIdResponse)
      ..delete("/posts/<id>", deletePostByIdResponse);

    return router;
  }
}
