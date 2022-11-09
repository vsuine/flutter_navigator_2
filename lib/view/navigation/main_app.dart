import 'package:flutter/material.dart';
import 'package:flutter_application_1/provider/navigation/bottom_navigation.dart';
import 'package:flutter_application_1/provider/navigation/sample_tabbar_navigation.dart';
import 'package:flutter_application_1/provider/navigation/selected_data_detail_stack.dart';
import 'package:flutter_application_1/provider/navigation/setting_navigation.dart';
import 'package:flutter_application_1/provider/scroll_position_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_application_1/view/navigation/nested_router_delegate.dart';

class MainApp extends ConsumerWidget {
  const MainApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Android の戻るボタンなどの制御をネストされた Router に渡す
    ChildBackButtonDispatcher childBackButtonDispatcher = Router.of(context)
        .backButtonDispatcher!
        .createChildBackButtonDispatcher()
      ..takePriority();
    return Scaffold(
      body: Router(
        routerDelegate: NestedRouterDelegate(ref),
        backButtonDispatcher: childBackButtonDispatcher,
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: ref.watch(bottomNavigationStackProvider
              .select((value) => value.last.rawValue)),
          type: BottomNavigationBarType.fixed,
          onTap: (value) {
            final isNotSameTab = ref
                .read(bottomNavigationStackProvider.notifier)
                .push(BottomNavigationState.from(rawValue: value));
            if (isNotSameTab) {
              return;
            }
            // 同じタブを選択したならタブの初期化を行う
            final tab = BottomNavigationState.from(rawValue: value);
            switch (tab) {
              case BottomNavigationState.home:
                // スクロール位置をトップに戻す
                ref
                    .read(homeViewScrollPositionProvider.notifier)
                    .update((state) => 0.0);
                break;
              case BottomNavigationState.tabSample:
                if (ref.read(sampleTabProvider) != SampleTabBar.tab02) {
                  break;
                }
                // スクロール位置をトップに戻す
                ref
                    .read(tabSampleSubViewScrollPosition.notifier)
                    .update((state) => 0.0);
                break;
              case BottomNavigationState.dataList:
                if (ref.read(selectedSampleDataStackProvider
                    .select((value) => value.isEmpty))) {
                  // スクロール位置をトップに戻す
                  ref
                      .read(dataListScrollPositionProvider.notifier)
                      .update((state) => 0.0);
                  break;
                }
                // 詳細ページなら閉じる
                ref.read(selectedSampleDataStackProvider.notifier).clear();
                break;
              case BottomNavigationState.setting:
                // 詳細設定ページを閉じる
                ref
                    .read(isOpenSettingDetailProvider.notifier)
                    .update((state) => false);
                break;
            }
          },
          items: BottomNavigationState.values
              .map((e) => BottomNavigationBarItem(icon: e.icon, label: e.name))
              .toList()),
    );
  }
}
