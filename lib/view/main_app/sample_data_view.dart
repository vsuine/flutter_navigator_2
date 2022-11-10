import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/sample_data.dart';
import 'package:flutter_application_1/provider/navigation/navigate_triger_provider.dart';
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
    ref.listen(
        initDataListScrollPositionProvider,
        (previous, next) => scrollController.animateTo(
            scrollController.position.minScrollExtent,
            curve: Curves.easeOut,
            duration: const Duration(seconds: 1)));
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
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              ),
        ),
      ),
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
                    ref.read(navigateTrigerProvider.notifier).navigate();
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
