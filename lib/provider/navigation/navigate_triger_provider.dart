import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final navigateTrigerProvider =
    StateNotifierProvider<NavigateTrigerNotifier, bool>(
        (ref) => NavigateTrigerNotifier());

class NavigateTrigerNotifier extends StateNotifier<bool> {
  NavigateTrigerNotifier() : super(false);
  void navigate() {
    debugPrint('navigate is called');
    state = !state;
  }
}
