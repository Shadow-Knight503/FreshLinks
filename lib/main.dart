import 'package:firebase_core/firebase_core.dart';
import 'package:freshlinks/screens/splash.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:freshlinks/firebase_options.dart' show DefaultFirebaseOptions;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp( const MyApp() );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splash(),
      // home: Builder(
      //   builder: (context) {
      //     return Scaffold(
      //       appBar: AppBar(
      //         backgroundColor: Colors.blue,
      //         title: const Text('Home Page'),
      //       ),
      //       body: Fetch(key: UniqueKey()),
      //     );
      //   }
      // ),
    );
  }
}
