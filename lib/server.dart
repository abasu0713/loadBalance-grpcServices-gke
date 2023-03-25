
import 'package:grpc/grpc.dart';
import 'package:gcp/gcp.dart' as gcp;
import 'package:grpc_test_ground/service.dart';


void main(List<String> arguments){
  print("Starting gRCP Server");
  runGrpcTranslatorOnServer(arguments);
}

Future<void> runGrpcTranslatorOnServer(List<String> args) async {
  final server = Server([EchoService()]);
  final listenPort = gcp.listenPort();
  await server.serve(port: listenPort);
  print("Sever started and is listening on port: $listenPort");
}