import 'dart:io';
import 'package:shelf/shelf_io.dart';
import 'package:shelf_hotreload/shelf_hotreload.dart';
import 'routes/main_routes.dart';

void main() {
  withHotreload(() => createServer(), logLevel: Level.INFO);
}

Future<HttpServer> createServer() async {
  final ip = InternetAddress.anyIPv4;
  final port = int.parse(Platform.environment['PORT'] ?? '8080');
  final server = await serve(MainRoutes.router, ip, port);
  print(
    'Server listening on port http://${server.address.host}:${server.port}',
  );

  return server;
}
