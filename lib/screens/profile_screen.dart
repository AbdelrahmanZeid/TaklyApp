import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:takly/cubits/pick_image_cubit/pick_image_cubit.dart';
import 'package:takly/cubits/pick_image_cubit/pick_image_state.dart';
import 'package:takly/helper/save_value.dart';
import 'package:takly/screens/welcome_screen.dart';
import 'package:takly/theme/change_theme.dart';
import 'package:takly/widgets/custom_text_form_field.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});
  final formKey = GlobalKey<FormState>();

  final saveValue = SaveValue();
  static const routeName = 'profilescreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
            child: IconButton(
              onPressed: () async {
                GoogleSignIn().disconnect();
                final firebase = await FirebaseAuth.instance;

                firebase.signOut();
                Navigator.pushReplacementNamed(
                    context, WelcomeScreen.routeName);
              },
              icon: Icon(
                Icons.exit_to_app,
                color: Colors.red,
              ),
            ),
          ),
        ],
        leading: IconButton(
          onPressed: () {
            ChangeTheme().changeThemeMode();
          },
          icon: Icon(
            Icons.dark_mode,
            color: Colors.grey,
          ),
        ),
      ),
      body: BlocConsumer<PickImageCubit, PickImageStates>(
        builder: (BuildContext ctx, state) {
          PickImageCubit pickImageCubit = PickImageCubit.get(ctx);

          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Form(
              key: formKey,
              child: ListView(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Center(
                        child: Container(
                          width: 130,
                          height: 130,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(18),
                          ),
                          child: pickImageCubit.url != null
                              ? ClipRRect(
                                  borderRadius: BorderRadius.circular(65),
                                  child: Image.network(
                                    pickImageCubit.url!,
                                  ),
                                )
                              : ClipRRect(
                                  borderRadius: BorderRadius.circular(65),
                                  child: Image.asset(
                                    'assets/images/Main_Image/no_image.jpg',
                                    fit: BoxFit.fill,
                                  ),
                                ),
                        ),
                      ),
                      Positioned(
                        right: 130,
                        top: 100,
                        child: IconButton(
                          onPressed: () async {
                            await pickImageCubit.pickImage();
                          },
                          icon: Icon(
                            Icons.photo,
                            color: Colors.blue,
                            size: 35,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  CustomTextFormField(
                    myController: TextEditingController(
                      text: saveValue.getValue('myData'),
                    ),
                    onChanged: (value) {
                      if (value != null) {
                        saveValue.setValue('myData', value);
                      }
                    },
                    textInputType: TextInputType.name,
                    lable: ' Name',
                    obscureText: false,
                    validator: (val) {
                      if (val == null) {
                        'shouldnot be empty';
                      } else {
                        return;
                      }
                    },
                    onSaved: (val) {
                      if (val!.isEmpty) {
                        'shouldnot be empty';
                      } else {
                        return;
                      }
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextFormField(
                    myController: TextEditingController(
                      text: saveValue.getValue('myData2'),
                    ),
                    onChanged: (value) {
                      if (value != null) {
                        saveValue.setValue('myData2', value);
                      }
                    },
                    textInputType: TextInputType.name,
                    lable: ' Bio',
                    obscureText: false,
                    validator: (val) {
                      if (val == null) {
                        'shouldnot be empty';
                      } else {
                        return;
                      }
                    },
                    onSaved: (val) {
                      if (val!.isEmpty) {
                        'shouldnot be empty';
                      } else {
                        return;
                      }
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                 

                  const SizedBox(height: 10,),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(340, 60),
                      elevation: 5,
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {
                      if (formKey.currentState!.validate())
                        formKey.currentState!.save();

                      Navigator.pop(context);
                    },
                    child: Text(
                      'Complete',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        listener: (BuildContext context, Object? state) {},
      ),
    );
  }
}
