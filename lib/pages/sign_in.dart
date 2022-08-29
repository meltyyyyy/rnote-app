import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class SignIn extends HookWidget {
  const SignIn({Key? key}) : super(key: key);
  static const BoxConstraints _constraints = BoxConstraints(
      minWidth: 240, maxWidth: 280, minHeight: 40, maxHeight: 48);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          const Align(
            alignment: Alignment.center,
            child: Text('logo'),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ElevatedButton(
                      onPressed: () {},
                      child: Container(
                          constraints: _constraints,
                          alignment: Alignment.center,
                          child: const Text('sign in'))),
                  const SizedBox(
                    height: 16,
                  ),
                  ElevatedButton(
                      onPressed: () {},
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
    );
  }
}
