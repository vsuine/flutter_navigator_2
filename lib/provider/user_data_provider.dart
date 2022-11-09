import 'package:flutter_application_1/data/user_data.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// ログイン時に UserData を初期化して、使うときにはここを参照する
final userDataProvider = StateProvider<UserData?>((ref) => null);
