///
//  Generated code. Do not modify.
//  source: echo-grpc.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'echo-grpc.pb.dart' as $0;
export 'echo-grpc.pb.dart';

class EchoClient extends $grpc.Client {
  static final _$echo = $grpc.ClientMethod<$0.EchoRequest, $0.Response>(
      '/arkobasu.space.grpc.Echo/Echo',
      ($0.EchoRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Response.fromBuffer(value));
  static final _$reverseEcho = $grpc.ClientMethod<$0.EchoRequest, $0.Response>(
      '/arkobasu.space.grpc.Echo/ReverseEcho',
      ($0.EchoRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Response.fromBuffer(value));

  EchoClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.Response> echo($0.EchoRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$echo, request, options: options);
  }

  $grpc.ResponseFuture<$0.Response> reverseEcho($0.EchoRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$reverseEcho, request, options: options);
  }
}

abstract class EchoServiceBase extends $grpc.Service {
  $core.String get $name => 'arkobasu.space.grpc.Echo';

  EchoServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.EchoRequest, $0.Response>(
        'Echo',
        echo_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.EchoRequest.fromBuffer(value),
        ($0.Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.EchoRequest, $0.Response>(
        'ReverseEcho',
        reverseEcho_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.EchoRequest.fromBuffer(value),
        ($0.Response value) => value.writeToBuffer()));
  }

  $async.Future<$0.Response> echo_Pre(
      $grpc.ServiceCall call, $async.Future<$0.EchoRequest> request) async {
    return echo(call, await request);
  }

  $async.Future<$0.Response> reverseEcho_Pre(
      $grpc.ServiceCall call, $async.Future<$0.EchoRequest> request) async {
    return reverseEcho(call, await request);
  }

  $async.Future<$0.Response> echo(
      $grpc.ServiceCall call, $0.EchoRequest request);
  $async.Future<$0.Response> reverseEcho(
      $grpc.ServiceCall call, $0.EchoRequest request);
}
