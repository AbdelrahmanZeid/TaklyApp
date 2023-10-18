import 'package:flutter/material.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword();

  static const routeName = 'forgetpassword';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            
            Center(
              child: Text(
                'Forget Password ?',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
