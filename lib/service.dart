
import 'dart:convert';

import 'package:grpc/grpc.dart';
import 'package:grpc_test_ground/src/generated/sample-grpc.pbgrpc.dart';


class EchoService extends EchoServiceBase{
  @override
  Future<EchoResponse> echo(ServiceCall call, EchoRequest request) async {
    print("gRPC call to Echo.Echo with content: ${request.content}");
    final valueToReturn = {
      'response': request.content
    };
    final response = jsonEncode(valueToReturn);
    return EchoResponse()..content = response;
  }

  @override
  Future<ReverseEchoResponse> reverseEcho(ServiceCall call, EchoRequest request) async {
    print("gRPC call to Echo.Echo with content: ${request.content}");
    final valueToReturn = {
      'response': request.content.split('').reversed.join()
    };
    final response = jsonEncode(valueToReturn);
    return ReverseEchoResponse()..content = response;
  }
}