///
//  Generated code. Do not modify.
//  source: sample-grpc.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use echoRequestDescriptor instead')
const EchoRequest$json = const {
  '1': 'EchoRequest',
  '2': const [
    const {'1': 'content', '3': 1, '4': 1, '5': 9, '10': 'content'},
  ],
};

/// Descriptor for `EchoRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List echoRequestDescriptor = $convert.base64Decode('CgtFY2hvUmVxdWVzdBIYCgdjb250ZW50GAEgASgJUgdjb250ZW50');
@$core.Deprecated('Use echoResponseDescriptor instead')
const EchoResponse$json = const {
  '1': 'EchoResponse',
  '2': const [
    const {'1': 'content', '3': 1, '4': 1, '5': 9, '10': 'content'},
  ],
};

/// Descriptor for `EchoResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List echoResponseDescriptor = $convert.base64Decode('CgxFY2hvUmVzcG9uc2USGAoHY29udGVudBgBIAEoCVIHY29udGVudA==');
@$core.Deprecated('Use reverseEchoResponseDescriptor instead')
const ReverseEchoResponse$json = const {
  '1': 'ReverseEchoResponse',
  '2': const [
    const {'1': 'content', '3': 1, '4': 1, '5': 9, '10': 'content'},
  ],
};

/// Descriptor for `ReverseEchoResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List reverseEchoResponseDescriptor = $convert.base64Decode('ChNSZXZlcnNlRWNob1Jlc3BvbnNlEhgKB2NvbnRlbnQYASABKAlSB2NvbnRlbnQ=');
