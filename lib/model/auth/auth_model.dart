import 'package:flutter_application_1/data/user_data.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:uuid/uuid.dart';

final authServiceProvider = Provider<BaseAuthService>((ref) => AuthService());

/// ログイン認証などの処理を担う。api サービスが担うこともあるかも？
abstract class BaseAuthService {
  Future<UserData> loginWithEmailAndPassword(String email, String password);
  Future<String?> logout();
  Future<String?> signUp(String email, String password, String confirmPassword);
  Future<UserData?> fetchSession();
}

class AuthService extends BaseAuthService {
  final Uuid _uuid = const Uuid();
  Future<void> _wait() async {
    await Future.delayed(const Duration(seconds: 1));
  }

  @override
  Future<UserData> loginWithEmailAndPassword(
      String email, String password) async {
    await _wait();
    return UserData(id: _uuid.v4(), name: 'sample name');
  }

  @override
  Future<String?> logout() async {
    await _wait();
    return null;
  }

  @override
  Future<String?> signUp(
      String email, String password, String confirmPassword) async {
    return null;
  }

  @override
  Future<UserData?> fetchSession() async {
    return UserData(id: _uuid.v4(), name: 'session name');
  }
}
