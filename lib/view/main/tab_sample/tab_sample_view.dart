import 'package:flutter/material.dart';
import 'package:flutter_application_1/provider/navigation/main_navigation_state_notifier.dart';
import 'package:flutter_application_1/provider/navigation/navigate_trigger_provider.dart';
import 'package:flutter_application_1/data/navigation/sample_tab_bar_state.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// TabBarを用いた Widget の例
class TabSampleView extends HookConsumerWidget {
  const TabSampleView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tabController = useTabController(
      initialLength: SampleTabBarState.values.length,
      initialIndex: ref
          .read(
              mainNavigationStateProvider.select((value) => value.sampleTabBar))
          .rawValue,
    );
    ref.listen(
        mainNavigationStateProvider.select((value) => value.sampleTabBar),
        (previous, next) {
      if (tabController.indexIsChanging) {
        return;
      }
      tabController.animateTo(next.rawValue);
    });
    tabController.addListener(() {
      if (tabController.indexIsChanging == false) {
        return;
      }
      ref.read(mainNavigationStateProvider.notifier).updateMainRoutePath(
          sampleTabBar:
              SampleTabBarState.fromIndex(rawValue: tabController.index));
      ref.read(navigateTriggerProvider.notifier).navigate();
    });
    return Scaffold(
      appBar: AppBar(
        title: const Text("TabSampleView"),
        bottom: TabBar(
          controller: tabController,
          tabs: SampleTabBarState.values
              .map((e) => Tab(child: Text(e.tabName)))
              .toList(),
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: SampleTabBarState.values.map((e) => e.widget).toList(),
      ),
    );
  }
}

// MEMO: AppBarを使用しないTabBar
// appBar: PreferredSize(
//   preferredSize: const Size.fromHeight(kToolbarHeight),
//   child: SafeArea(
//       child: TabBar(
//           controller: tabController,
//           tabs: SampleTabBarState.values
//               .map((e) => Tab(child: Text(e.tabName)))
//               .toList())),