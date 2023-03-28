import 'dart:io';
import 'package:grpc/grpc.dart';
import 'package:grpc/grpc_or_grpcweb.dart' as grpc_web;
import 'package:grpc_test_ground/src/generated/echo-grpc.pbgrpc.dart';

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

  final arg = args.isNotEmpty ? args.join(" ") : 'Hello World';
  print("Arg: $arg");

  try {
    /*final channel = grpc_web.GrpcOrGrpcWebClientChannel.grpc(
      '34.72.122.195',
      port: 443,
      options: ChannelOptions(
        credentials: ChannelCredentials.secure(
          certificates: File('/Users/alphaduriendur/workspace/grpc-test-ground/client.pem').readAsBytesSync(),
          authority: 'grpc.arkobasu.space',
          onBadCertificate: (cert, host) => true,
        ),
      ),
    );*/
    final channel = ClientChannel(
      'localhost',
      port: 8080,
      options: const ChannelOptions(
        credentials: ChannelCredentials.insecure())
    );
    print("Channel created!");
    final stub = EchoClient(channel);
    print("Stub created!");
    var response = await stub.echo(EchoRequest()..content = arg);
    print('gRPC client (Echo.Echo) received: ${response.content}');
    var response2 = await stub.reverseEcho(EchoRequest()..content = arg);
    print('gRPC client (Echo.ReverseEcho) received: ${response2.content}');
    await channel.terminate();
  } catch (e) {
    print('Caught error: $e');
    exit(1);
  }
}