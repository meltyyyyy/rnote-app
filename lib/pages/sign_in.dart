import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class SignIn extends HookWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController _emailCtl = useTextEditingController(text: '');
    final TextEditingController _passwordCtl = useTextEditingController(text: '');

    const BoxConstraints _constraints = BoxConstraints(
        minWidth: 240, maxWidth: 280, minHeight: 40, maxHeight: 48);
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Align(
            alignment: Alignment.center,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  TextFormField(
                    controller: _emailCtl,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(hintText: 'email'),
                  ),
                  TextFormField(
                    controller: _passwordCtl,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(hintText: 'password'),
                  )
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ElevatedButton(
                      onPressed: () {

                      },
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
