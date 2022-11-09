import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/sample_data.dart';
import 'package:flutter_application_1/provider/navigation/selected_data_detail_stack.dart';
import 'package:flutter_application_1/provider/sample_data_provider.dart';
import 'package:flutter_application_1/provider/scroll_position_provider.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SampleDataListView extends HookConsumerWidget {
  const SampleDataListView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scrollController = useScrollController(
        initialScrollOffset: ref.read(dataListScrollPositionProvider));
    scrollController.addListener(() => ref
        .read(dataListScrollPositionProvider.notifier)
        .update((state) => scrollController.offset));
    ref.listen(dataListScrollPositionProvider,
        (previous, next) => scrollController.jumpTo(next));
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sample Data'),
      ),
      body: RefreshIndicator(
          onRefresh: () async {
            ref.invalidate(sampleDataProvider);
          },
          child: SingleChildScrollView(
              controller: scrollController,
              child: ref.watch(sampleDataProvider).when(
                  data: (data) => Column(
                      children:
                          data.map((e) => SampleDataView(data: e)).toList()),
                  error: (error, stackTrace) =>
                      const ListTile(title: Text('Error')),
                  loading: () => const SizedBox(
                      height: 300,
                      child: Center(child: CircularProgressIndicator()))))),
      floatingActionButton: FloatingActionButton(
          onPressed: () => ref.invalidate(sampleDataProvider),
          child: const Icon(Icons.refresh)),
    );
  }
}

class SampleDataView extends StatelessWidget {
  const SampleDataView({Key? key, required this.data}) : super(key: key);
  final SampleData data;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      height: 256,
      width: double.infinity,
      child: Card(
          child: Consumer(
              builder: (context, ref, child) => InkWell(
                  onTap: () {
                    ref
                        .read(selectedSampleDataStackProvider.notifier)
                        .push(data.id);
                  },
                  child: Center(child: Text(data.counter.toString()))))),
    );
  }
}

class SampleDataDetailView extends StatelessWidget {
  const SampleDataDetailView({Key? key, required this.id}) : super(key: key);
  final String id;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Samplel Detail View')),
      body: Center(child: Text('id: $id')),
    );
  }
}
