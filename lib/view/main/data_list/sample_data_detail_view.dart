import 'package:flutter/material.dart';
import 'package:flutter_application_1/provider/main/data_list/sample_data_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SampleDataDetailView extends StatelessWidget {
  const SampleDataDetailView({Key? key, required this.id}) : super(key: key);
  final String id;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sample Detail View')),
      body: Center(
        child: Consumer(
          builder: (context, ref, child) =>
              ref.watch(sampleDataProvider(id)).when(
                    data: (data) => Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("title: ${data.title}"),
                          Text("content: ${data.content}"),
                        ]),
                    error: (e, s) => Text(e.toString()),
                    loading: () => const CircularProgressIndicator(),
                  ),
        ),
      ),
    );
  }
}
