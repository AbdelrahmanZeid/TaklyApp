import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:takly/cubits/bloc_observer.dart';
import 'package:takly/cubits/login_cubit/login_cubit.dart';
import 'package:takly/cubits/sign_up_cubit/sign_up_cubit.dart';
import 'package:takly/screens/chat_screen.dart';
import 'package:takly/screens/login_screen.dart';
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
  Bloc.observer = MyBlocObserver();
}

class Takly extends StatelessWidget {
  const Takly({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginCubit(),
        ),
        BlocProvider(
          create: (context) => SignUpCubit(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => const SplashScreen(),
          LoginScreen.routeName: (context) => LoginScreen(),
          ChatScreen.routeName: (context) => ChatScreen(),
        },
      ),
    );
  }
}
