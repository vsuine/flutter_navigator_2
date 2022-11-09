import 'dart:math';

import 'package:flutter_application_1/data/sample_data.dart';
import 'package:flutter_application_1/model/api/api_service.dart';
import 'package:uuid/uuid.dart';

// retrofit で自動生成クラスのモック
// わざわざ API サービスや ローカルサーバーを作らないでテストするため
class MockApiService implements ApiClient {
  final Uuid _uuid = const Uuid();
  final Random _random = Random();
  Future<void> _await({Duration? duration}) async {
    await Future.delayed(duration ?? const Duration(seconds: 2));
    return;
  }

  @override
  Future<SampleData> fetchSample(String id) async {
    await _await();
    return SampleData(id: id, counter: 100);
  }

  @override
  Future<List<SampleData>> fetchSampleList() async {
    await _await();
    return [
      SampleData(id: _uuid.v4(), counter: _random.nextInt(50)),
      SampleData(id: _uuid.v4(), counter: _random.nextInt(50)),
      SampleData(id: _uuid.v4(), counter: _random.nextInt(50)),
      SampleData(id: _uuid.v4(), counter: _random.nextInt(50)),
      SampleData(id: _uuid.v4(), counter: _random.nextInt(50)),
      SampleData(id: _uuid.v4(), counter: _random.nextInt(50)),
      SampleData(id: _uuid.v4(), counter: _random.nextInt(50)),
      SampleData(id: _uuid.v4(), counter: _random.nextInt(50)),
      SampleData(id: _uuid.v4(), counter: _random.nextInt(50)),
      SampleData(id: _uuid.v4(), counter: _random.nextInt(50)),
    ];
  }
}
