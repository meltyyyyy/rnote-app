import 'package:flutter/material.dart';

import 'sign_in.dart';

class Launcher extends StatelessWidget {
  const Launcher({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const bool isSignIn = false;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!isSignIn) {
        Navigator.pushReplacement(
            context, MaterialPageRoute<void>(builder: (_) => const SignIn()));
      }
    });

    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
