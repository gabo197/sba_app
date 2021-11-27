import 'dart:async';

import 'package:flutter/material.dart';

import 'app_cache.dart';

class SbaTab {
  static const int home = 0;
  static const int profile = 1;
}

class AppStateManager extends ChangeNotifier {
  bool _initialized = false;
  bool _loggedIn = false;
  bool _onboardingComplete = false;
  bool _signedUp = true;
  bool _signupComplete = true;
  int _selectedTab = SbaTab.home;
  final _appCache = AppCache();

  bool get isInitialized => _initialized;
  bool get isLoggedIn => _loggedIn;
  bool get isOnboardingComplete => _onboardingComplete;
  bool get isSignedUp => _signedUp;
  bool get isSignupComplete => _signupComplete;
  int get getSelectedTab => _selectedTab;

  void initializeApp() async {
    _loggedIn = await _appCache.isUserLoggedIn();
    _onboardingComplete = await _appCache.didCompleteOnboarding();

    Timer(
      const Duration(milliseconds: 1000),
      () {
        _initialized = true;
        notifyListeners();
      },
    );
  }

  void login(String username, String password) async {
    _loggedIn = true;
    await _appCache.cacheUser();
    notifyListeners();
  }

  void customerSignup() async {
    _signupComplete = true;
    notifyListeners();
  }

  void technicianSignup() async {}

  void completeOnboarding() async {
    _onboardingComplete = true;
    await _appCache.completeOnboarding();
    notifyListeners();
  }

  void goToTab(index) {
    _selectedTab = index;
    notifyListeners();
  }

  void logout() async {
    _initialized = false;
    _selectedTab = 0;
    await _appCache.invalidate();

    initializeApp();
    notifyListeners();
  }
}
