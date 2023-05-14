// ignore_for_file: file_names
import 'package:shelf_router/shelf_router.dart';

import '../Responses/response.dart';

// ignore: camel_case_types
class routerHandler {
  Router get myRouter {
    final router = Router()
      ..get('/', prinntUniversalResponse)
      // CRUD operations...
      ..post('/posts', addPostResponse)
      ..get('/posts/<id>', displayByIdResponse)
      ..delete('/posts/<id>', deleteByIdResponse);

    return router;
  }
}
