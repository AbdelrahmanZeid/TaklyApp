import 'package:flutter/material.dart';
import 'package:takly/constants/app_constant.dart';
import 'package:takly/helper/auth.dart';
import 'package:takly/screens/chat_screen.dart';
import 'package:takly/screens/sign_in_with_number.dart';
import 'package:takly/screens/sign_up_screen.dart';
import 'package:takly/widgets/custom_button.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 23, vertical: 18),
          child: SingleChildScrollView(
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.center,
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
                    await Auth().signInWithGoogle(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return ChatScreen();
                        },
                      ),
                    );
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomButton(
                  btnText: 'Sign in with Facebook',
                  imagePath: 'assets/images/Icon_Button/Facebook.png',
                  socialName: 'Facebook',
                  onPressed: () {},
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomButton(
                  btnText: 'Sign in with Apple',
                  imagePath: 'assets/images/Icon_Button/Apple.png',
                  socialName: 'Apple',
                  onPressed: () {},
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
                    Image.asset('assets/images/Main_Image/Rectangle 2161.png'),
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
                    Image.asset('assets/images/Main_Image/Rectangle 2161.png'),
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return SignWithNumber();
                        },
                      ),
                    );
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
                          return SignUpScreen(socialName: '');
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
    );
  }
}
