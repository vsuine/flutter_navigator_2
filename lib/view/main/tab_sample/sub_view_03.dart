import 'package:flutter/material.dart';
import 'package:flutter_application_1/provider/main/scroll_position_provider.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// ref が build の最初から必要な場合は ConsumerWidget を使用する
/// また、HookConsumerWidget のように HookWidget との併用も可能
class SubView03 extends HookConsumerWidget {
  const SubView03({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scrollController = useScrollController(
        initialScrollOffset: ref.read(tabSampleSubViewScrollPositionProvider));
    scrollController.addListener(() {
      ref
          .read(tabSampleSubViewScrollPositionProvider.notifier)
          .update((state) => scrollController.offset);
    });
    ref.listen(
        initTabSampleSubViewScrollPosition,
        (previous, next) =>
            scrollController.jumpTo(scrollController.position.minScrollExtent));
    return Scaffold(
        body: ListView.builder(
      controller: scrollController,
      itemBuilder: (context, index) => ListTile(
        title: Text((index + 1).toString()),
      ),
      itemCount: 100,
    ));
  }
}
