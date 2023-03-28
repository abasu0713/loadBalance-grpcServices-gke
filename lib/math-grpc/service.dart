

import 'package:grpc/grpc.dart';
import 'package:grpc_test_ground/src/generated/math-grpc.pbgrpc.dart';

class MathService extends MathServiceBase {
  @override
  Stream<IntegerNumber> fibonacciSeries(ServiceCall call, IntegerNumber request) async* {
    print("gRPC call to Math.FibonacciSeries with value: ${request.value}");
    await for (int f in _fibonacci().take(request.value)) {
      yield IntegerNumber()..value = f;
    }
  }

  Stream<int> _fibonacci() async* {
    int a = 0, b = 1;
    while (true) {
      yield a;
      int temp = a + b;
      a = b;
      b = temp;
    }
  }

  @override
  Future<BoolResponse> isPrime(ServiceCall call, IntegerNumber request) async {
    print("gRPC call to Math.IsPrime with value: ${request.value}");
    return BoolResponse()..value = _isPrime(request.value);
  }

  bool _isPrime(N) {
    for (var i = 2; i <= N / i; ++i) {
      if (N % i == 0) {
        return false;
      }
    }
    return true;
  }

}