import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../controllers/firebase/auth_controller.dart';
import '../providers/firebase/auth_provider.dart';

class Launcher extends ConsumerWidget {
  const Launcher({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool isSignIn = ref.read(authProvider.notifier).isSignIn;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (false) {
        Navigator.pushReplacementNamed(context, '/home');
      } else {
        Navigator.pushReplacementNamed(context, '/sign_in');
      }
    });

    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
