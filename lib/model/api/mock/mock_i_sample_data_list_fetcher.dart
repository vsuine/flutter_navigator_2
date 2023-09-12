import 'dart:math';
import 'package:flutter_application_1/data/sample_data.dart';
import 'package:flutter_application_1/model/api/i_sample_data_list_fetcher.dart';
import 'package:uuid/uuid.dart';

class MockISampleDataListFetcher implements ISampleDataListFetcher {
  final _uuid = const Uuid();
  final _rand = Random();
  @override
  Future<List<SampleData>> fetchSampleDataList(String idToken) async {
    await Future.delayed(const Duration(seconds: 1));
    return [
      SampleData(id: _uuid.v4(), title: "sample_title ${_rand.nextInt(1000)}"),
      SampleData(id: _uuid.v4(), title: "sample_title ${_rand.nextInt(1000)}"),
      SampleData(id: _uuid.v4(), title: "sample_title ${_rand.nextInt(1000)}"),
      SampleData(id: _uuid.v4(), title: "sample_title ${_rand.nextInt(1000)}"),
      SampleData(id: _uuid.v4(), title: "sample_title ${_rand.nextInt(1000)}"),
      SampleData(id: _uuid.v4(), title: "sample_title ${_rand.nextInt(1000)}"),
      SampleData(id: _uuid.v4(), title: "sample_title ${_rand.nextInt(1000)}"),
      SampleData(id: _uuid.v4(), title: "sample_title ${_rand.nextInt(1000)}"),
      SampleData(id: _uuid.v4(), title: "sample_title ${_rand.nextInt(1000)}"),
      SampleData(id: _uuid.v4(), title: "sample_title ${_rand.nextInt(1000)}"),
      SampleData(id: _uuid.v4(), title: "sample_title ${_rand.nextInt(1000)}"),
      SampleData(id: _uuid.v4(), title: "sample_title ${_rand.nextInt(1000)}"),
      SampleData(id: _uuid.v4(), title: "sample_title ${_rand.nextInt(1000)}"),
      SampleData(id: _uuid.v4(), title: "sample_title ${_rand.nextInt(1000)}"),
      SampleData(id: _uuid.v4(), title: "sample_title ${_rand.nextInt(1000)}"),
      SampleData(id: _uuid.v4(), title: "sample_title ${_rand.nextInt(1000)}"),
      SampleData(id: _uuid.v4(), title: "sample_title ${_rand.nextInt(1000)}"),
      SampleData(id: _uuid.v4(), title: "sample_title ${_rand.nextInt(1000)}"),
      SampleData(id: _uuid.v4(), title: "sample_title ${_rand.nextInt(1000)}"),
      SampleData(id: _uuid.v4(), title: "sample_title ${_rand.nextInt(1000)}"),
    ];
  }
}
