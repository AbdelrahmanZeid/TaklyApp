import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:takly/constants/app_constant.dart';
import 'package:takly/cubits/login_cubit/login_cubit.dart';
import 'package:takly/cubits/login_cubit/login_states.dart';
import 'package:takly/cubits/sign_up_cubit/sign_up_cubit.dart';
import 'package:takly/screens/chat_screen.dart';

import '../widgets/custom_text_form_field.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({
    super.key,
  });

  static const routeName = 'loginscreen';

  @override
  final formKey = GlobalKey<FormState>();
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginStates>(
      builder: (context, state) {
        LoginCubit chatCubit = LoginCubit.get(context);
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
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
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
                        'Login',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      const SizedBox(
                        height: 35,
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
                            chatCubit.userEmail = value;
                          }
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomTextFormField(
                        lable: 'Enter your password',
                        suffixIcon: chatCubit.isviasable == false
                            ? Icons.visibility
                            : Icons.visibility_off,
                        textInputType: TextInputType.visiblePassword,
                        obscureText: chatCubit.isviasable,
                        onPressed: () {
                          chatCubit.switchValue();
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
                            chatCubit.userPassword = value;
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
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {
                            if (FirebaseAuth.instance.currentUser != null) {
                              chatCubit.signInWithEmail();
                            }
                            formKey.currentState!.save();
                            Navigator.pushReplacementNamed(
                              context,
                              ChatScreen.routeName,
                            );
                          }
                        },
                        child: Text(
                          'Get Started',
                          style: TextStyle(color: Colors.black),
                        ),
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(340, 58),
                          elevation: 8,
                          backgroundColor: kPrimaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Forget Password ?',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: kPrimaryColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
      listener: (context, state) {
        if (state is LoginLoadingState) {
          CircularProgressIndicator();
        } else if (state is LoginSuccessState) {
          Get.snackbar('Success', 'login success');
        } else {
          LoginFailuerState(
            errorMessage: 'There is an error',
          );
        }
      },
    );
  }
}

// && SignUpCubit.get(context).userEmail ==
//               LoginCubit.get(context).userEmail &&
//           SignUpCubit.get(context).userPassword ==
//               LoginCubit.get(context).userPassword
