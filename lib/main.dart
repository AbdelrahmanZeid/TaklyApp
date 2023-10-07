import 'package:flutter/material.dart';
 import 'package:takly/screens/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    const Takly(),
    
  );
}

class Takly extends StatelessWidget {
  const Takly({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
       // brightness: Brightness.dark,
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const SplashScreen(),
        // SignInSocialScreen.routeName: (context) =>
        //     const SignInSocialScreen(socialName: ''),
      },
    );
  }
}
