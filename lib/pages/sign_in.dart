import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../controllers/user_controller.dart';
import '../providers/firebase/auth_provider.dart';
import '../providers/user_ptovider.dart';
import 'sign_up.dart';

class SignIn extends HookConsumerWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final UserController userCtl = ref.read(userProvider.notifier);
    final String error = ref.watch(authErrorProvider);

    final TextEditingController _emailCtl = useTextEditingController(text: '');
    final TextEditingController _passwordCtl =
        useTextEditingController(text: '');

    const BoxConstraints _constraints = BoxConstraints(
        minWidth: 240, maxWidth: 280, minHeight: 40, maxHeight: 48);
    final FocusNode _focusNode = FocusNode();
    return Focus(
      focusNode: _focusNode,
      child: GestureDetector(
        onTap: () => _focusNode.requestFocus(),
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Align(
                alignment: Alignment.center,
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      TextFormField(
                        controller: _emailCtl,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(hintText: 'email'),
                      ),
                      TextFormField(
                        controller: _passwordCtl,
                        textInputAction: TextInputAction.done,
                        keyboardType: TextInputType.visiblePassword,
                        decoration: const InputDecoration(hintText: 'password'),
                      ),
                      const SizedBox(height: 16),
                      Text(error,
                          style:
                              const TextStyle(fontSize: 12, color: Colors.red))
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 24),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      ElevatedButton(
                          onPressed: () => userCtl
                                  .signIn(_emailCtl.text, _passwordCtl.text)
                                  .then((bool result) {
                                if (result) {
                                  Navigator.pushReplacementNamed(
                                      context, '/home');
                                }
                              }),
                          child: Container(
                              constraints: _constraints,
                              alignment: Alignment.center,
                              child: const Text('sign in'))),
                      const SizedBox(
                        height: 16,
                      ),
                      ElevatedButton(
                          onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute<void>(
                                  builder: (_) => const SignUp())),
                          child: Container(
                              constraints: _constraints,
                              alignment: Alignment.center,
                              child: const Text('sign up')))
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
