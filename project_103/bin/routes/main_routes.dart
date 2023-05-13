import 'package:shelf_router/shelf_router.dart';

import '../response/responses.dart';

class MainRoutes {
  static final router = Router()
    ..all('/', rootHandler)
    ..get('/post/<id>', findPostHandler)
    ..post('/posts', createPostHandler)
    ..delete('/delete_post/<id>', deletePostHandler);
}
