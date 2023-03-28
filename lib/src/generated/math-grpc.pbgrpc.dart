///
//  Generated code. Do not modify.
//  source: math-grpc.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'math-grpc.pb.dart' as $0;
export 'math-grpc.pb.dart';

class MathClient extends $grpc.Client {
  static final _$fibonacciSeries =
      $grpc.ClientMethod<$0.IntegerNumber, $0.IntegerNumber>(
          '/arkobasu.space.grpc.Math/FibonacciSeries',
          ($0.IntegerNumber value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.IntegerNumber.fromBuffer(value));
  static final _$isPrime =
      $grpc.ClientMethod<$0.IntegerNumber, $0.BoolResponse>(
          '/arkobasu.space.grpc.Math/IsPrime',
          ($0.IntegerNumber value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.BoolResponse.fromBuffer(value));

  MathClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseStream<$0.IntegerNumber> fibonacciSeries(
      $0.IntegerNumber request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(
        _$fibonacciSeries, $async.Stream.fromIterable([request]),
        options: options);
  }

  $grpc.ResponseFuture<$0.BoolResponse> isPrime($0.IntegerNumber request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$isPrime, request, options: options);
  }
}

abstract class MathServiceBase extends $grpc.Service {
  $core.String get $name => 'arkobasu.space.grpc.Math';

  MathServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.IntegerNumber, $0.IntegerNumber>(
        'FibonacciSeries',
        fibonacciSeries_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $0.IntegerNumber.fromBuffer(value),
        ($0.IntegerNumber value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.IntegerNumber, $0.BoolResponse>(
        'IsPrime',
        isPrime_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.IntegerNumber.fromBuffer(value),
        ($0.BoolResponse value) => value.writeToBuffer()));
  }

  $async.Stream<$0.IntegerNumber> fibonacciSeries_Pre(
      $grpc.ServiceCall call, $async.Future<$0.IntegerNumber> request) async* {
    yield* fibonacciSeries(call, await request);
  }

  $async.Future<$0.BoolResponse> isPrime_Pre(
      $grpc.ServiceCall call, $async.Future<$0.IntegerNumber> request) async {
    return isPrime(call, await request);
  }

  $async.Stream<$0.IntegerNumber> fibonacciSeries(
      $grpc.ServiceCall call, $0.IntegerNumber request);
  $async.Future<$0.BoolResponse> isPrime(
      $grpc.ServiceCall call, $0.IntegerNumber request);
}
