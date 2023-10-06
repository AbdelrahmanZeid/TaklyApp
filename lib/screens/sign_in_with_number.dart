 import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:takly/helper/auth.dart';
// import 'package:takly/screens/chat_screen.dart';

// class SignWithNumber extends StatelessWidget {
//   const SignWithNumber({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 15),
//           child: TextField(
//             onSubmitted: (value) {
//               Auth().phoneAuth(context, value);
//             },
//             keyboardType: TextInputType.number,
//             decoration: InputDecoration(
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 label: Text('Enter your phone number'),
//                 hintText: '+20 number'),
//           ),
//         ),
//       ),
//     );
//   }




//}




class SignWithNumber extends StatefulWidget {
  @override
  _SignWithNumberState createState() => _SignWithNumberState();
}

class _SignWithNumberState extends State<SignWithNumber> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  TextEditingController _phoneNumberController = TextEditingController();
  TextEditingController _otpController = TextEditingController();

  String verificationId = '';

  Future<void> _verifyPhoneNumber() async {
    String phoneNumber="" ; // Replace with the phone number to verify.

    await _auth.verifyPhoneNumber(
      phoneNumber:_phoneNumberController.text,
      verificationCompleted: (PhoneAuthCredential credential) {
        // Auto-retrieve the SMS code and sign in the user.
        _signInWithCredential(credential);
      },
      verificationFailed: (FirebaseAuthException e) {
        print('Verification failed: $e');
        // Handle verification failure.
      },
      codeSent: (String verificationId, int? resendToken) {
        setState(() {
          this.verificationId = verificationId;
        });
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        setState(() {
          this.verificationId = verificationId;
        });
      },
    );
  }

  Future<void> _signInWithCredential(PhoneAuthCredential credential) async {
    try {
      final authResult = await _auth.signInWithCredential(credential);
      print('User signed in: ${authResult.user!.uid}');
      // Perform further actions with the signed-in user
    } catch (error) {
      print('Sign-in error: $error');
      // Handle sign-in error
    }
  }

  Future<void> _verifyOtp() async {
    String otp = _otpController.text.trim();

    PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: verificationId,
      smsCode: otp,
    );

    _signInWithCredential(credential);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
     
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(16.0),
              child: TextFormField(
                controller: _phoneNumberController,
                
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  
                  labelText: 'Phone Number',
                ),
              ),
            ),
            ElevatedButton(
              onPressed: _verifyPhoneNumber,
              child: Text('Send OTP'),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: TextFormField(
                controller: _otpController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'OTP',
                ),
              ),
            ),
            ElevatedButton(
              onPressed: _verifyOtp,
              child: Text('Verify OTP'),
            ),
          ],
        ),
      ),
    );
  }
}
//+44 7123 123 456