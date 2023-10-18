import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:takly/constants/app_constant.dart';
import 'package:takly/cubits/auth_cubit/auth_cubit.dart';
import 'package:takly/cubits/auth_cubit/auth_state.dart';
 import 'package:takly/screens/home_screen.dart';

import 'package:takly/screens/sign_up_screen.dart';
import 'package:takly/widgets/custom_button.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  static const routeName = 'welcomescreen';

  @override
  Widget build(BuildContext context) {
    AuthCubit authCubit = AuthCubit.get(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 23, vertical: 18),
          child: SingleChildScrollView(
            child: BlocListener<AuthCubit, AuthStates>(
              listener: (BuildContext context, state) {
                if (state is AuthWithGoogleStateLoadig) {
                  CircularProgressIndicator();
                } else if (state is AuthWithGoogleStateSuccess) {
                  Navigator.pushNamed(context, HomeScreen.routeName);
                  log('success');
                } else {
                  log('fail');
                }
              },
              child: Column(
                children: [
                  const SizedBox(
                    height: 70,
                  ),
                  Center(
                    child: Image.asset('assets/images/Main_Image/Talky_2.png'),
                  ),
                  const SizedBox(
                    height: 78,
                  ),
                  CustomButton(
                    btnText: 'Sign in with Google',
                    imagePath: 'assets/images/Icon_Button/iconGoogle.png',
                    socialName: 'Google',
                    onPressed: () async {
                      await authCubit.signInWithGoogle();
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomButton(
                    btnText: 'Sign in with Facebook',
                    imagePath: 'assets/images/Icon_Button/Facebook.png',
                    socialName: 'Facebook',
                    onPressed: () async {
                      await authCubit.signInWithFacebook();
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomButton(
                    btnText: 'Sign in with Twitter',
                    imagePath: 'assets/images/Main_Image/twitter.png',
                    socialName: 'Apple',
                    onPressed: ()async {
                      await authCubit.signInWithTwitter();


                    },
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const SizedBox(
                        width: 25,
                      ),
                      Image.asset(
                          'assets/images/Main_Image/Rectangle 2161.png'),
                      const SizedBox(
                        width: 25,
                      ),
                      Text(
                        'or',
                        style: TextStyle(fontSize: 15),
                      ),
                      const SizedBox(
                        width: 25,
                      ),
                      Image.asset(
                          'assets/images/Main_Image/Rectangle 2161.png'),
                      const SizedBox(
                        width: 25,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(348, 70),
                      elevation: 5,
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {
                      
                    },
                    child: Text(
                      'Continue with phone number',
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                  ),
                  const SizedBox(
                    height: 55,
                  ),
                  Text(
                    'Dont have an account ?',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return SignUpScreen();
                          },
                        ),
                      );
                    },
                    child: Text(
                      'Sign up here',
                      style: TextStyle(
                          color: kPrimaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
