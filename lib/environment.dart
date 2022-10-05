import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Environment {
  static const endpoint = "https://myendpoint.com";

  static Environment? _instance;

  Future<String> serverEndpoint() {
    return Future.value(endpoint);
  }

  Future<PremiumMode> premiumMode() {
    return Future.value(PremiumMode.app);
  }

  Future<int> freeAttemptsCount() {
    return Future.value(2);
  }

  static Environment getEnvironment() {
    var instance = _instance;
    if (instance != null) {
      return instance;
    }
    if (kDebugMode) {
      instance = DebugEnvironment();
    } else {
      instance = Environment();
    }
    _instance = instance;
    return instance;
  }
}

enum PremiumMode { app, premium, free }

class DebugEnvironment extends Environment {
  static const _prefsKeyServerEndpoint = "server_endpoint";
  static const _prefsKeyPremiumMode = "premium_mode";
  static const _prefsKeyFreeAttemptsCount = "free_attempts_count";
  static const endpointStage = "https://stage.myendpoint.com";
  static const endpointDebug = "https://debug.myendpoint.com";

  static const endpoints = [
    Environment.endpoint,
    endpointStage,
    endpointDebug
  ];

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  @override
  Future<String> serverEndpoint() async {
    return _getString(_prefsKeyServerEndpoint, super.serverEndpoint);
  }

  updateServerEndpoint(String endpoint) {
    _saveString(_prefsKeyServerEndpoint, endpoint);
  }

  @override
  Future<int> freeAttemptsCount() async {
    return _getInt(_prefsKeyFreeAttemptsCount, super.freeAttemptsCount);
  }

  updateFreeAttemptsCount(int count) {
    _saveInt(_prefsKeyFreeAttemptsCount, count);
  }

  @override
  Future<PremiumMode> premiumMode() async {
    final fallbackValue = await super.premiumMode();
    final storedValue = await _getString(
        _prefsKeyPremiumMode, () => Future.value(fallbackValue.name));
    final mode =
        PremiumMode.values.firstWhere((element) => element.name == storedValue);
    return Future.value(mode);
  }

  updatePremiumMode(PremiumMode premiumMode) {
    _saveString(_prefsKeyPremiumMode, premiumMode.name);
  }

  _saveString(String key, String value) async {
    final prefs = await _prefs;
    prefs.setString(key, value);
  }

  Future<String> _getString(
      String key, Future<String> Function() fallback) async {
    final prefs = await _prefs;
    final endpoint = prefs.getString(key);
    if (endpoint == null) {
      return fallback();
    }
    return Future.value(endpoint);
  }

  _saveInt(String key, int value) async {
    final prefs = await _prefs;
    prefs.setInt(key, value);
  }

  Future<int> _getInt(String key, Future<int> Function() fallback) async {
    final prefs = await _prefs;
    final endpoint = prefs.getInt(key);
    if (endpoint == null) {
      return fallback();
    }
    return Future.value(endpoint);
  }
}
