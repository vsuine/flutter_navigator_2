import 'package:flutter/material.dart';
import 'package:flutter_application_1/provider/navigation/bottom_navigation.dart';
import 'package:flutter_application_1/provider/navigation/navigate_triger_provider.dart';
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
        // 戻るボタンの制御をネストされた Router に渡す
        backButtonDispatcher: childBackButtonDispatcher,
        // ネストされた route information parser はもし設定しても呼び出されることはない
        // OS への URL 変更通知がネストされた Router からでも飛ばせるほうが直観的なのになぜ？
        routeInformationParser: null,
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
              ref.read(navigateTrigerProvider.notifier).navigate();
              return;
            }
            // 同じタブを選択したならタブの初期化を行う
            final tab = BottomNavigationState.from(rawValue: value);
            switch (tab) {
              case BottomNavigationState.home:
                // スクロール位置をトップに戻す
                ref
                    .read(initHomeViewScrollPositionProvider.notifier)
                    .update((state) => !state);
                break;
              case BottomNavigationState.tabSample:
                if (ref.read(sampleTabProvider) != SampleTabBar.tab02) {
                  break;
                }
                // スクロール位置をトップに戻す
                ref
                    .read(initTabSampleSubViewScrollPosition.notifier)
                    .update((state) => !state);
                break;
              case BottomNavigationState.dataList:
                if (ref.read(selectedSampleDataStackProvider
                    .select((value) => value.isEmpty))) {
                  // スクロール位置をトップに戻す
                  ref
                      .read(initDataListScrollPositionProvider.notifier)
                      .update((state) => !state);
                  break;
                }
                // 詳細ページなら閉じる
                ref.read(selectedSampleDataStackProvider.notifier).clear();
                ref.read(navigateTrigerProvider.notifier).navigate();
                break;
              case BottomNavigationState.setting:
                // 詳細設定ページを閉じる
                if (ref.read(isOpenSettingDetailProvider)) {
                  ref
                      .read(isOpenSettingDetailProvider.notifier)
                      .update((state) => false);
                  ref.read(navigateTrigerProvider.notifier).navigate();
                }
                break;
            }
          },
          items: BottomNavigationState.values
              .map((e) => BottomNavigationBarItem(icon: e.icon, label: e.name))
              .toList()),
    );
  }
}
