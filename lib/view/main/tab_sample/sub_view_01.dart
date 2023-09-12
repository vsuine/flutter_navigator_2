import 'package:flutter/material.dart';
import 'package:flutter_application_1/provider/main/sample_stream_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SubView01 extends StatelessWidget {
  const SubView01({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Count Up Stream"),
            const SizedBox(height: 32),
            // 状態管理が必要であれば Consumer で ref を用いて参照しにいく
            Consumer(
              builder: (context, ref, child) =>
                  ref.watch(sampleStreamProvider).when(
                        data: (data) => Text(
                          "$data",
                          style: const TextStyle(fontSize: 24),
                        ),
                        error: (e, s) => Text(e.toString()),
                        loading: () => const CircularProgressIndicator(),
                      ),
            ),
          ],
        ),
      ),
    );
  }
}
