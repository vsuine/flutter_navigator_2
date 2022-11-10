import 'package:flutter/material.dart';
import 'package:flutter_application_1/provider/scroll_position_provider.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeView extends HookConsumerWidget {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scrollController = useScrollController(
        initialScrollOffset: ref.read(homeViewScrollPositionProvider));
    scrollController.addListener(() {
      // スクロール位置の変更に応じて復元するための位置を更新する
      ref
          .read(homeViewScrollPositionProvider.notifier)
          .update((state) => scrollController.offset);
    });
    // 外部からスクロール位置の変更がされれば適応するため listen する
    ref.listen(initHomeViewScrollPositionProvider,
        (previous, next) => scrollController.jumpTo(0.0));
    return Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
        ),
        body: ListView.builder(
            controller: scrollController,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) => ListTile(
                  title: Text(index.toString()),
                ),
            itemCount: 100));
  }
}
