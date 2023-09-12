import 'package:flutter_application_1/data/sample_data.dart';
import 'package:flutter_application_1/model/api/i_sample_data_post.dart';

class MockISampleDataPost implements ISampleDataPost {
  @override
  Future<void> postSampleData(SampleData sampleData) async {
    await Future.delayed(const Duration(seconds: 1));
    return;
  }
}
