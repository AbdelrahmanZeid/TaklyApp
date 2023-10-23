import 'package:flutter/material.dart';
import 'package:takly/screens/home_screen.dart';
  import 'package:takly/widgets/custom_text_form_field.dart';

class ContinueWithPhone extends StatefulWidget {
  static const routeName = 'continuewithphone';

  @override
  State<ContinueWithPhone> createState() => _ContinueWithPhoneState();
}

class _ContinueWithPhoneState extends State<ContinueWithPhone> {
  @override
  final formKey = GlobalKey<FormState>();
   late String phoneNumber;
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextFormField(
                textInputType: TextInputType.number,
                lable: 'Enter your phone number',
                obscureText: false,
                validator: (phone) {
                  if (phone!.isEmpty) {
                    'Field is required';
                  } else if (phone.length < 11) {
                    'Invalid phone number ';
                  } else{
                    return null;
                  }
                    
                },
                onSaved: (phone) {
                  if (phone!.isNotEmpty) {
                    phoneNumber=phone;
                  }else{
                    return null;
                  }
                },
              ),
              const SizedBox(
                height: 15,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(150, 55),
                  elevation: 5,
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    Navigator.pushNamed(context, HomeScreen.routeName);
                  }
                },
                child: Text(
                  'Continue',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
