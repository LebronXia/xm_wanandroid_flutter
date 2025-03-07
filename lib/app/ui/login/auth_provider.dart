import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider with ChangeNotifier {
  final SharedPreferences _prefs;
  bool _isLoggedIn = false;
  String? _token;

  AuthProvider(this._prefs) {
    _loadCredentials();
  }

  bool get isLoggedIn => _isLoggedIn;
  String? get token => _token;

  Future<void> _loadCredentials() async {
    _token = _prefs.getString('auth_token');
    _isLoggedIn = _token != null;
    notifyListeners();
  }

  Future<void> login(String username, String password) async {
    // 这里添加实际登录API调用
    final mockToken = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...';

    await _prefs.setString('auth_token', mockToken);
    _token = mockToken;
    _isLoggedIn = true;
    notifyListeners();
  }

  Future<void> logout() async {
    await _prefs.remove('auth_token');
    _token = null;
    _isLoggedIn = false;
    notifyListeners();
  }
}