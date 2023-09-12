import 'package:flutter_application_1/data/auth/session_info.dart';
import 'package:flutter_application_1/data/auth/user_data.dart';
import 'package:flutter_application_1/data/utils/unknown_exception.dart';
import 'package:flutter_application_1/provider/session_timeout_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class UserDataStateNotifier extends StateNotifier<AsyncValue<UserData?>> {
  UserDataStateNotifier(this._ref) : super(const AsyncLoading());

  final StateNotifierProviderRef _ref;

  SessionInfo get sessionInfo {
    final res = state.when(
      data: (data) => data!.sessionInfo,
      error: (_, __) => null,
      loading: () => null,
    );
    if (res == null) {
      _ref.read(isSessionTimeoutProvider.notifier).update((state) => true);
      throw UnknownException();
    }
    return res;
  }

  void update(UserData? userData) {
    state = AsyncData(userData);
  }
}

// ログイン時に UserData を初期化して、使うときにはここを参照する
final userDataProvider =
    StateNotifierProvider<UserDataStateNotifier, AsyncValue<UserData?>>((ref) {
  return UserDataStateNotifier(ref);
});
