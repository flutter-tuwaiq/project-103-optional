import 'dart:io';

import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'package:shelf_hotreload/shelf_hotreload.dart';
import 'package:shelf_router/shelf_router.dart';

import 'Routes/MainRoute.dart';

void main() {
  withHotreload(() => createServer());
}

Future<HttpServer> createServer() async {
  final ip = InternetAddress.anyIPv4;

  final port = int.parse(Platform.environment['PORT'] ?? '8080');
  final server = await serve(MainRoute().handler, ip, port);
  print('Server starting at http://${server.address.host}:${server.port}');

  return server;
}
