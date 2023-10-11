import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fluchat/src/services/auth_services/auth_services.dart';
import 'package:fluchat/src/ui/pages/auth/sign_in_up_page/sign_up_page.dart';
import 'package:fluchat/src/ui/pages/auth/splash_page/splash_page.dart';
import 'package:fluchat/src/ui/pages/homa.dart';
import 'package:flutter/material.dart';

import 'src/ui/pages/auth/sign_in_up_page/sign_in_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo Chat',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const CheckUser(),
      routes: {
        SplashPage.id: (context) => const SplashPage(),
        SignInPage.id: (context) => const SignInPage(),
        SignUpPage.id: (context) => const SignUpPage(),
      },
    );
  }
}

class CheckUser extends StatelessWidget {
  const CheckUser({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: AuthServices().getCurrentUser(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return const Center(
            child: Icon(
              Icons.error_outline_outlined,
              color: Colors.red,
            ),
          );
        } else {
          if (snapshot.data == null) {
            return const SplashPage();
          } else {
            return const Home();
          }
        }
      },
    );
  }
}
