import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@singleton
class SharedPreferencesUtils {
  late SharedPreferences _prefs;
  late Future<bool> _initFuture;

  SharedPreferencesUtils() {
    _initFuture = init();
  }

  Future<bool> init() async {
    _prefs = await SharedPreferences.getInstance();
    return true;
  }

  Future<void> setToken(String token) async {
    await _initFuture;
    _prefs.setString('token', token);
  }

  String? getToken() {
    if (!_isInitialized()) {
      print('SharedPreferences has not been initialized yet.');
      return null;
    }
    return _prefs.getString('token');
  }

  Future<void> removeToken() async {
    await _initFuture;
    await _prefs.remove('token');
  }

  bool _isInitialized() {
    if (_prefs == null) {
      if (kDebugMode) {
        print('SharedPreferences has not been initialized yet.');
      }
      return false;
    }
    return true;
  }
}
