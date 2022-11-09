import 'package:hooks_riverpod/hooks_riverpod.dart';

final selectedSampleDataStackProvider =
    StateNotifierProvider<SelectedSampleDataStack, List<String>>(
        (ref) => SelectedSampleDataStack());

class SelectedSampleDataStack extends StateNotifier<List<String>> {
  SelectedSampleDataStack() : super([]);
  void clear() {
    state = [];
  }

  void pop() {
    if (state.isEmpty) {
      return;
    }
    state = [...(state..removeLast())];
  }

  void push(String id) {
    state = [...state..add(id)];
  }
}
