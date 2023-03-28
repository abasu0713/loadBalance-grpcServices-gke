

import 'package:grpc/grpc.dart';
import 'package:gcp/gcp.dart' as gcp;
import 'package:grpc_test_ground/math-grpc/service.dart';


void main(){
  print("Starting gRCP Server");
  _runGrpcServer();
}

Future<void> _runGrpcServer() async {
  final server = Server([MathService()]);
  final listenPort = gcp.listenPort();
  await server.serve(port: listenPort);
  print("Sever started and is listening on port: $listenPort");
}