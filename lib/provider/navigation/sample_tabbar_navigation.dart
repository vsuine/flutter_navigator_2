import 'package:hooks_riverpod/hooks_riverpod.dart';

enum SampleTabBar {
  tab01(0),
  tab02(1),
  tab03(2);

  final int rawValue;
  const SampleTabBar(this.rawValue);
  factory SampleTabBar.from({required int rawValue}) {
    return SampleTabBar.values.firstWhere(
      (element) => element.rawValue == rawValue,
      orElse: () => SampleTabBar.tab01,
    );
  }
}

extension SampleTabBarPathNameExt on SampleTabBar {
  String get pathName {
    switch (this) {
      case SampleTabBar.tab01:
        return 'path01';
      case SampleTabBar.tab02:
        return 'path02';
      case SampleTabBar.tab03:
        return 'path03';
    }
  }
}

final sampleTabProvider = StateProvider((ref) => SampleTabBar.tab01);
