import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/sample_data.dart';
import 'package:flutter_application_1/provider/navigation/main_navigation_state_notifier.dart';
import 'package:flutter_application_1/provider/navigation/navigate_trigger_provider.dart';
import 'package:flutter_application_1/provider/main/data_list/sample_data_list_provider.dart';
import 'package:flutter_application_1/provider/main/scroll_position_provider.dart';
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
          ref.invalidate(sampleDataListProvider);
        },
        child: SingleChildScrollView(
          controller: scrollController,
          child: ref.watch(sampleDataListProvider).when(
                data: (data) => Column(
                    children:
                        data.map((e) => _SampleDataView(data: e)).toList()),
                error: (error, stackTrace) =>
                    ListTile(title: Text(error.toString())),
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

class _SampleDataView extends StatelessWidget {
  const _SampleDataView({Key? key, required this.data}) : super(key: key);
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
                  .read(mainNavigationStateProvider.notifier)
                  .updateMainRoutePath(selectedSampleDataId: data.id);
              ref.read(navigateTriggerProvider.notifier).navigate();
            },
            child: Center(
              child: Text(data.title),
            ),
          ),
        ),
      ),
    );
  }
}
