import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:takly/cubits/auth_cubit/auth_cubit.dart';
import 'package:takly/cubits/bloc_observer.dart';
import 'package:takly/cubits/login_cubit/login_cubit.dart';
import 'package:takly/cubits/pick_image_cubit/pick_image_cubit.dart';
import 'package:takly/cubits/send_messsage_cubit/send_message_cubit.dart';
import 'package:takly/cubits/sign_up_cubit/sign_up_cubit.dart';
import 'package:takly/screens/chat_screen.dart';
import 'package:takly/screens/continue_with_phone_screen.dart';
import 'package:takly/screens/forget_password_screen.dart';
import 'package:takly/screens/home_screen.dart';
import 'package:takly/screens/login_screen.dart';
import 'package:takly/screens/profile_screen.dart';
import 'package:takly/screens/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:takly/screens/welcome_screen.dart';
import 'package:takly/theme/change_theme.dart';
import 'firebase_options.dart';

main() async {

 await GetStorage.init();
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
        BlocProvider(
          create: (context) => SendMessageCubit(),
        ),
        BlocProvider(
          create: (context) => AuthCubit(),
        ),
        BlocProvider(
          create: (context) => PickImageCubit(),
        ),
      ],
      child: GetMaterialApp(
        theme: ThemeData(
          useMaterial3: true,
        ),
        darkTheme: ThemeData.dark(),
        themeMode: ChangeTheme().getThemeMode(),
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => const SplashScreen(),
          LoginScreen.routeName: (context) => LoginScreen(),
          ChatScreen.routeName: (context) => ChatScreen(),
          ProfileScreen.routeName: (context) => ProfileScreen(),
          WelcomeScreen.routeName: (context) => WelcomeScreen(),
          HomeScreen.routeName: (context) => HomeScreen(),
          ForgetPassword.routeName:(context)=>ForgetPassword(),
          ContinueWithPhone.routeName:(context) =>ContinueWithPhone(), 
        },
      ),
    );
  }
}
