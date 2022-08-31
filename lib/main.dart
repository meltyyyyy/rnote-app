import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'pages/home.dart';
import 'pages/launcher.dart';
import 'pages/sign_in.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Future.wait<void>(<Future<dynamic>>[
    Firebase.initializeApp(),
    dotenv.load(fileName: '.env')
  ]);
  runApp(const ProviderScope(child: RnoteApp()));
}

class RnoteApp extends StatelessWidget {
  const RnoteApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rnote App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: <String, Widget Function(BuildContext)>{
        '/': (_) => const Launcher(),
        '/home': (_) => const Home(),
        '/sign_in': (_) => const SignIn(),
      },
      initialRoute: '/',
    );
  }
}
