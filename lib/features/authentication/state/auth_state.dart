import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthModel extends ChangeNotifier {
  late final StreamSubscription<AuthState> subscription;

  AuthModel() {
    Supabase.instance.client.auth.onAuthStateChange.listen((event) {
      if (event.event == AuthChangeEvent.signedIn) {
        setAuthenticated(isAuthenticated: true);
        final accessToken = event.session?.accessToken;
      } else {
        setAuthenticated(isAuthenticated: false);
      }
    });
  }

  bool _isAuthenticated = false;
  bool get isAuthenticated => _isAuthenticated;

  void setAuthenticated({required bool isAuthenticated}) {
    _isAuthenticated = isAuthenticated;
    notifyListeners();
  }

  Future<void> signInWithGithub() async {
    await Supabase.instance.client.auth.signInWithOAuth(
      Provider.github,
      redirectTo: 'devevents://demo.app/authRedirect',
    );
  }

  Future<void> signOut() async {
    await Supabase.instance.client.auth.signOut();
  }
}
