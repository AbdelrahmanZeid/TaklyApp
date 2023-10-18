import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:takly/constants/app_constant.dart';
import 'package:takly/cubits/sign_up_cubit/sign_up_cubit.dart';
import 'package:takly/cubits/sign_up_cubit/sign_up_states.dart';
import 'package:takly/screens/login_screen.dart';

import '../widgets/custom_text_form_field.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({
    super.key,
  });

  @override
  final formKey = GlobalKey<FormState>();
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        leading: Row(
          children: [
            const SizedBox(
              width: 5,
            ),
            IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                size: 22,
                color: Colors.black,
              ),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
      body: BlocConsumer<SignUpCubit, SignUpStates>(
        builder: (context, state) {
          SignUpCubit signUpCubit = SignUpCubit.get(context);
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                        child: Image.asset(
                          'assets/images/Main_Image/Talky_2.png',
                          width: 135,
                          height: 135,
                        ),
                      ),
                      Text(
                        'Sign Up ',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      CustomTextFormField(
                        lable: 'Enter your name',
                        textInputType: TextInputType.name,
                        obscureText: false,
                        onPressed: () {},
                        validator: (String? value) {},
                        onSaved: (value) {},
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomTextFormField(
                        lable: 'Enter your Email address',
                        textInputType: TextInputType.emailAddress,
                        obscureText: false,
                        onPressed: () {},
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return 'Email should not be empty';
                          } else if (!value.contains('@')) {
                            return 'Email should contain @';
                          } else if (!value.contains(
                            RegExp(r'[0-9]'),
                          )) {
                            return 'Email should contain a number';
                          } else {
                            return null;
                          }
                        },
                        onSaved: (value) {
                          if (value!.isNotEmpty) {
                            signUpCubit.userEmail = value;
                          }
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomTextFormField(
                        lable: 'Enter your password',
                        suffixIcon: signUpCubit.isviasable == false
                            ? Icons.visibility
                            : Icons.visibility_off,
                        textInputType: TextInputType.visiblePassword,
                        obscureText: signUpCubit.isviasable,
                        onPressed: () {
                          signUpCubit.switchValue();
                        },
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return 'Password should not be empty';
                          } else if (value.length < 10) {
                            return 'Password should at least 10 char';
                          } else
                            return null;
                        },
                        onSaved: (value) {
                          if (value!.isNotEmpty) {
                            signUpCubit.userPassword = value;
                          }
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(
                            width: 25,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 130,
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {
                            await signUpCubit.signUpWithEmail();
                            formKey.currentState!.save();
                          }
                        },
                        child: Text(
                          'Sign up ',
                          style: TextStyle(color: Colors.black),
                        ),
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(340, 58),
                          elevation: 5,
                          backgroundColor: kPrimaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Already have an account ?',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, LoginScreen.routeName);
                        },
                        child: Text(
                          'Login ',
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
        },
        listener: (BuildContext context, SignUpStates state) {
          if (state is SignUpLoadingState) {
            CircularProgressIndicator();
          } else if (state is SignUpSuccessState) {
            Navigator.pushNamed(
              context,
              LoginScreen.routeName,
            );
          } else {
            Text('there is an error');
          }
        },
      ),
    );
  }
}
