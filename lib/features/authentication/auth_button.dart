import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'state/auth_state.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({super.key});

  @override
  Widget build(BuildContext context) {
    final authModel = context.watch<AuthModel>();

    return IconButton(
      onPressed: () => authModel.isAuthenticated ? authModel.signOut() : authModel.signInWithGithub(),
      icon: authModel.isAuthenticated ? const Icon(Icons.logout) : const Icon(Icons.account_circle),
    );
  }
}
