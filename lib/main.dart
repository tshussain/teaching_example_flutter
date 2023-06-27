import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:teaching_example_flutter/model/AuthRepository.dart';
import 'package:teaching_example_flutter/model/ProfileRepository.dart';
import 'RegisterPage.dart';
import 'UserPage.dart';
import 'UsersPage.dart';
import 'firebase_options.dart';

import 'AboutUs.dart';
import 'ContactUs.dart';
import 'HomePage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

// This is my cool Branch 1 documentation
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    AuthRepository authRepository = AuthRepository();
    return
      MultiProvider(
        providers: [
          Provider<AuthRepository>(
            create: (_) => authRepository,
          ),
          StreamProvider(
            create: (context) => context.read<AuthRepository>().authState, initialData: null,
          ),
          ChangeNotifierProvider(create: (context) => ProfileRepository(authRepository)),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          routes: {
            'Home': (BuildContext context) => const HomePage(),
            'Users': (BuildContext context) => const UsersPage(),
            'User': (BuildContext context) => const UserPage(),
            'ContactUs': (BuildContext context) => const ContactUs(),
            'AboutUs': (BuildContext context) => const AboutUs(),
            'Register': (BuildContext context) => const RegisterPage()
          },
          initialRoute: 'Home',
        )
      );
  }
}

