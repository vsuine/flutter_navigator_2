import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/navigation/bottom_navigation_state.dart';
import 'package:flutter_application_1/provider/navigation/main_navigation_state_notifier.dart';
import 'package:flutter_application_1/provider/navigation/navigate_trigger_provider.dart';
import 'package:flutter_application_1/data/navigation/sample_tab_bar_state.dart';
import 'package:flutter_application_1/provider/main/scroll_position_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_application_1/view/navigation/nested_router_delegate.dart';

class MainApp extends ConsumerWidget {
  const MainApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // BottomNavigationBar は各画面共通のため、Routerをネストして実装する
    ChildBackButtonDispatcher childBackButtonDispatcher = Router.of(context)
        .backButtonDispatcher!
        .createChildBackButtonDispatcher()
      ..takePriority();
    return Scaffold(
      body: Router(
        routerDelegate: NestedRouterDelegate(ref),
        // 戻るボタンの制御をネストされた Router に渡す
        backButtonDispatcher: childBackButtonDispatcher,
        // ネストされた RouteInformationParser は設定しても呼び出されることはない
        routeInformationParser: null,
      ),
      // Drawer も bottomNavigationBar と同様に各画面共通のものであるならここに書く
      // drawer: const Drawer(
      //   child: Column(
      //     children: [
      //       ListTile(title: Text("SampleMenu")),
      //     ],
      //   ),
      // ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: ref.watch(mainNavigationStateProvider
              .select((value) => value.bottomNavigationState.rawValue)),
          type: BottomNavigationBarType.fixed,
          onTap: (value) {
            final isSameTab = ref.read(mainNavigationStateProvider
                .select((x) => x.bottomNavigationState.rawValue == value));
            if (isSameTab == false) {
              ref
                  .read(mainNavigationStateProvider.notifier)
                  .updateMainRoutePath(
                    bottomNavigationState:
                        BottomNavigationState.from(rawValue: value),
                  );
              ref.read(navigateTriggerProvider.notifier).navigate();
              return;
            }
            // 同じタブを選択したならタブの初期化を行う
            final tab = BottomNavigationState.from(rawValue: value);
            switch (tab) {
              case BottomNavigationState.home:
                break;
              case BottomNavigationState.tabSample:
                if (ref.read(mainNavigationStateProvider
                        .select((value) => value.sampleTabBar)) !=
                    SampleTabBarState.tab02) {
                  break;
                }
                // スクロール位置をトップに戻す
                ref
                    .read(initTabSampleSubViewScrollPosition.notifier)
                    .update((state) => !state);
                break;
              case BottomNavigationState.dataList:
                if (ref.read(mainNavigationStateProvider
                        .select((value) => value.selectedSampleDataId)) !=
                    null) {
                  // 詳細ページなら閉じる
                  ref
                      .read(mainNavigationStateProvider.notifier)
                      .updateMainRoutePath(
                          selectedSampleDataId: null,
                          resetSelectedSampleData: true);
                  ref.read(navigateTriggerProvider.notifier).navigate();
                  return;
                }
                // スクロール位置をトップに戻す
                ref
                    .read(initDataListScrollPositionProvider.notifier)
                    .update((state) => !state);
                return;
              case BottomNavigationState.setting:
                // 詳細設定ページを閉じる
                ref
                    .read(mainNavigationStateProvider.notifier)
                    .updateMainRoutePath(isOpenSettingsPopup: false);
                ref.read(navigateTriggerProvider.notifier).navigate();
                return;
            }
          },
          items: BottomNavigationState.values
              .map((e) => BottomNavigationBarItem(icon: e.icon, label: e.name))
              .toList()),
    );
  }
}
