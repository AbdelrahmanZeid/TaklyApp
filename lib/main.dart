import 'package:flutter/material.dart';
import 'package:takly/screens/sign_up_social_screen.dart';
import 'package:takly/screens/splash_screen.dart';

main() {
  runApp(
    const Takly(),
  );
}

class Takly extends StatelessWidget {
  const Takly({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const SplashScreen(),
        Sign_upSocialScreen.routeName:(context) => const Sign_upSocialScreen(socialName: ''),
      },
    );
  }
}
