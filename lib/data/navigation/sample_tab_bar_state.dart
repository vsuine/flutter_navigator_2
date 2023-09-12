import 'package:flutter/material.dart';
import 'package:flutter_application_1/view/main/tab_sample/sub_view_01.dart';
import 'package:flutter_application_1/view/main/tab_sample/sub_view_02.dart';
import 'package:flutter_application_1/view/main/tab_sample/sub_view_03.dart';

enum SampleTabBarState {
  tab01(0),
  tab02(1),
  tab03(2),
  ;

  final int rawValue;
  const SampleTabBarState(this.rawValue);
  factory SampleTabBarState.fromIndex({required int rawValue}) {
    return SampleTabBarState.values.firstWhere(
      (element) => element.rawValue == rawValue,
      orElse: () => SampleTabBarState.tab01,
    );
  }
  factory SampleTabBarState.fromPath({required String pathName}) {
    switch (pathName) {
      case "path01":
        return SampleTabBarState.tab01;
      case "path02":
        return SampleTabBarState.tab02;
      case "path03":
        return SampleTabBarState.tab03;
      default:
        return SampleTabBarState.tab01;
    }
  }

  String get pathName {
    switch (this) {
      case SampleTabBarState.tab01:
        return "path01";
      case SampleTabBarState.tab02:
        return "path02";
      case SampleTabBarState.tab03:
        return "path03";
    }
  }

  String get tabName {
    switch (this) {
      case SampleTabBarState.tab01:
        return "tab01";
      case SampleTabBarState.tab02:
        return "tab02";
      case SampleTabBarState.tab03:
        return "tab03";
    }
  }

  Widget get widget {
    switch (this) {
      case SampleTabBarState.tab01:
        return const SubView01();
      case SampleTabBarState.tab02:
        return const SubView02();
      case SampleTabBarState.tab03:
        return const SubView03();
    }
  }
}
