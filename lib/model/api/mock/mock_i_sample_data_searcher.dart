import 'dart:math';
import 'package:flutter_application_1/data/sample_data.dart';
import 'package:flutter_application_1/model/api/i_sample_data_searcher.dart';
import 'package:uuid/uuid.dart';

/// ISampleDataSearcher 実装クラス
class MockISampleDataSearcher implements ISampleDataSearcher {
  final _uuid = const Uuid();
  final _rand = Random();
  @override
  Future<SampleData> searchSampleData(String id, String idToken) async {
    await Future.delayed(const Duration(seconds: 1));
    return SampleData(
        id: _uuid.v4(),
        title: "sample_title ${_rand.nextInt(1000)}",
        content: "sample_content ${_rand.nextInt(1000)}");
  }
}
