import 'package:flutter_application_1/data/user_data.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:uuid/uuid.dart';

final authServiceProvider =
    Provider<BaseAuthService>((ref) => MockAuthService());

/// ログイン認証などの処理を担う。
abstract class BaseAuthService {
  Future<UserData> loginWithEmailAndPassword(String email, String password);
  Future<String?> logout();
  Future<String?> signUp(String email, String password, String confirmPassword);
  Future<UserData?> fetchSession();
}

class MockAuthService extends BaseAuthService {
  final Uuid _uuid = const Uuid();
  Future<void> _wait() async {
    await Future.delayed(const Duration(seconds: 1));
  }

  bool _hasSession = true;

  @override
  Future<UserData> loginWithEmailAndPassword(
      String email, String password) async {
    await _wait();
    _hasSession = true;
    return UserData(id: _uuid.v4(), name: 'sample name');
  }

  @override
  Future<String?> logout() async {
    await _wait();
    _hasSession = false;
    return null;
  }

  @override
  Future<String?> signUp(
      String email, String password, String confirmPassword) async {
    return null;
  }

  @override
  Future<UserData?> fetchSession() async {
    await _wait();
    if (_hasSession) {
      return UserData(id: _uuid.v4(), name: 'session name');
    }
    return null;
  }
}

class AuthException implements Exception {
  final String message;
  const AuthException(this.message);

  @override
  String toString() => message;
}
