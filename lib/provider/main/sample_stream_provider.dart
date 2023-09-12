import 'package:hooks_riverpod/hooks_riverpod.dart';

Stream<int> countUpStream() async* {
  int count = 0;
  while (count < 100) {
    await Future.delayed(const Duration(seconds: 1));
    count++;
    yield count;
  }
}

final sampleStreamProvider =
    StreamProvider.autoDispose((ref) => countUpStream());
