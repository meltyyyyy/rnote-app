import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'pages/home.dart';

Future<void> main() async {
  await dotenv.load(fileName: '.env');
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
        '/': (BuildContext context) => const Home()
      },
      initialRoute: '/',
    );
  }
}
