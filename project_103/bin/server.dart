import 'dart:io';

import 'package:shelf/shelf_io.dart';
import 'package:shelf_hotreload/shelf_hotreload.dart';
import 'Routes/main_route.dart';

void main() {
  withHotreload(() => createServer());
}

Future<HttpServer> createServer() async {
  final ip = InternetAddress.anyIPv4;

  final port = int.parse(Platform.environment['PORT'] ?? '8080');

  final server = await serve(MainRoute().myMainRoute, ip, port);
  print('Server listening on port ${server.address.host}:${server.port}');

  return server;
}
