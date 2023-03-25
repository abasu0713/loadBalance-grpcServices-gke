import 'package:grpc/grpc.dart';
import 'package:grpc_test_ground/src/generated/sample-grpc.pbgrpc.dart';

Future<void> main(List<String> args) async {
  final channel = ClientChannel(
    'localhost',
    port: 8080,
    options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
  );
  final stub = EchoClient(channel);

  final name = args.isNotEmpty ? "Hello ${args[0]}" : 'Hello un-named user';

  try {
    var response = await stub.echo(EchoRequest()..content = name);
    print('gRPC client (Echo.Echo) received: ${response.content}');
    var response2 = await stub.reverseEcho(EchoRequest()..content = name);
    print('gRPC client (Echo.ReverseEcho) received: ${response2.content}');
  } catch (e) {
    print('Caught error: $e');
  }
  await channel.shutdown();
}