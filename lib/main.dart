import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:teaching_example_flutter/model/UserRepository.dart';
import 'firebase_options.dart';

import 'AboutUs.dart';
import 'ContactUs.dart';
import 'HomePage.dart';

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return
      MultiProvider(
        providers: [
          Provider<UserRepository>(create: (_) => UserRepository.initialize())
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          routes: {
            'Home': (BuildContext context) => const HomePage(),
            'ContactUs': (BuildContext context) => const ContactUs(),
            'AboutUs': (BuildContext context) => const AboutUs()
          },
          home: const HomePage(),
        )
      );
  }
}

