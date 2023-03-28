
import 'dart:convert';

import 'package:grpc/grpc.dart' as grpc;
import 'package:grpc_test_ground/src/generated/echo-grpc.pbgrpc.dart';


class EchoService extends EchoServiceBase{
  @override
  Future<Response> echo(grpc.ServiceCall call, EchoRequest request) async {
    print("gRPC call to Echo.Echo with content: ${request.content}");
    final valueToReturn = {
      'response': request.content
    };
    final response = jsonEncode(valueToReturn);
    return Response()..content = response;
  }

  @override
  Future<Response> reverseEcho(grpc.ServiceCall call, EchoRequest request) async {
    print("gRPC call to Echo.ReverseEcho with content: ${request.content}");
    final valueToReturn = {
      'response': request.content.split('').reversed.join()
    };
    final response = jsonEncode(valueToReturn);
    return Response()..content = response;
  }
  
}