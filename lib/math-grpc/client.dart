import 'dart:io';
import 'dart:math';
import 'package:grpc/grpc.dart';
import 'package:grpc/grpc_or_grpcweb.dart' as grpc_web;
import 'package:grpc_test_ground/src/generated/math-grpc.pbgrpc.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

Future<void> main(List<String> args) async {
  final trustedRootStr = File("/Users/alphaduriendur/workspace/grpc-test-ground/client.pem").readAsBytesSync();
  SecurityContext.defaultContext.setTrustedCertificatesBytes(trustedRootStr.buffer.asUint8List());
  HttpOverrides.global = MyHttpOverrides();

  final randomNumber = Random().nextInt(20);
  print("Generated random number: $randomNumber");
  try {
    final channel = grpc_web.GrpcOrGrpcWebClientChannel.grpc(
      '35.232.180.51',
      port: 443,
      options: ChannelOptions(
        credentials: ChannelCredentials.secure(
          certificates: File('/Users/alphaduriendur/workspace/grpc-test-ground/client.pem').readAsBytesSync(),
          authority: 'grpc.arkobasu.space',
          onBadCertificate: (cert, host) => true,
        ),
      ),
    );
    /*final channel = ClientChannel(
        'localhost',
        port: 8080,
        options: const ChannelOptions(
            credentials: ChannelCredentials.insecure())
    );*/
    print("Channel created!");
    final stub = MathClient(channel);
    print("Stub created!");
    var response = await stub.isPrime(IntegerNumber()..value = randomNumber);
    print('gRPC client (Echo.IsPrime) received: ${response.value}');
    var response2 = stub.fibonacciSeries(IntegerNumber()..value = randomNumber);
    await for (final stream in response2){
      print('gRPC client (Echo.Fibonacci) received stream value: ${stream.value}');
    }
    await channel.terminate();
  } catch (e) {
    print('Caught error: $e');
    exit(1);
  }
}