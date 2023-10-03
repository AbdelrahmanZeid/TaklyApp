import 'package:flutter/material.dart';
import 'package:takly/constants/app_constant.dart';
import 'package:takly/screens/sign_in_screen.dart';
import 'package:takly/widgets/custom_button.dart';

class Sign_upScreen extends StatelessWidget {
  const Sign_upScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 23, vertical: 18),
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
                btnText: 'Sign up with Google',
                imagePath: 'assets/images/Icon_Button/iconGoogle.png',
                socialName: 'Google',
                 
              ),
              const SizedBox(
                height: 20,
              ),
              CustomButton(
                btnText: 'Sign up with Facebook',
                imagePath: 'assets/images/Icon_Button/Facebook.png',
                socialName: 'Facebook',
                 
              ),
              const SizedBox(
                height: 20,
              ),
              CustomButton(
                btnText: 'Sign up with Apple',
                imagePath: 'assets/images/Icon_Button/Apple.png',
                socialName: 'Apple',
                
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
                onPressed: () {},
                child: Text(
                  'Continue with phone number',
                  style: TextStyle(color: Colors.black, fontSize: 18),
                ),
              ),
              const SizedBox(
                height: 55,
              ),
              Text(
                'Already have an account ?',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              TextButton(
                onPressed: () {
                   Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return Sign_inScreen();
                          },
                        ),
                      );
                },
                child: Text(
                  'Sign in here',
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
    );
  }
}
