import 'package:flutter/material.dart';
import 'package:flutter_application_1/provider/navigation/navigate_triger_provider.dart';
import 'package:flutter_application_1/provider/navigation/sample_tabbar_navigation.dart';
import 'package:flutter_application_1/provider/scroll_position_provider.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TabSampleView extends HookConsumerWidget {
  const TabSampleView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tabController = useTabController(
        initialLength: 3, initialIndex: ref.read(sampleTabProvider).rawValue);
    ref.listen(sampleTabProvider, (previous, next) {
      if (tabController.indexIsChanging) {
        return;
      }
      tabController.animateTo(next.rawValue);
    });
    tabController.addListener(() {
      if (tabController.indexIsChanging == false) {
        return;
      }
      ref
          .read(sampleTabProvider.notifier)
          .update((state) => SampleTabBar.from(rawValue: tabController.index));
      debugPrint('addListener');
      ref.read(navigateTrigerProvider.notifier).navigate();
    });
    return Scaffold(
      appBar: AppBar(
        title: const Text('TabSampleView'),
        bottom: TabBar(controller: tabController, tabs: const [
          Tab(
            child: Text('01'),
          ),
          Tab(
            child: Text('02'),
          ),
          Tab(
            child: Text('03'),
          ),
        ]),
      ),
      body: TabBarView(
        controller: tabController,
        children: const [
          SubView01(),
          SubView02(),
          SubView03(),
        ],
      ),
    );
  }
}

class SubView01 extends StatelessWidget {
  const SubView01({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('SubView01')),
    );
  }
}

class SubView02 extends HookConsumerWidget {
  const SubView02({Key? key}) : super(key: key);
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

class SubView03 extends StatelessWidget {
  const SubView03({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('SubView03')),
    );
  }
}
