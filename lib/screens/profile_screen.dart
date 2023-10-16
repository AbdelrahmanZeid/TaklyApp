import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:takly/cubits/pick_image_cubit/pick_image_cubit.dart';
import 'package:takly/cubits/pick_image_cubit/pick_image_state.dart';
import 'package:takly/screens/welcome_screen.dart';
import 'package:takly/widgets/custom_text_form_field.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

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
            if (Get.isDarkMode) {
              Get.changeTheme(
                ThemeData.light(),
              );
            } else {
              Get.changeTheme(
                ThemeData.dark(),
              );
            }
          },
          icon: Icon(
            Icons.dark_mode,
            color: Colors.grey,
          ),
        ),
      ),
      body: BlocConsumer<PickImageCubit,PickImageStates>(
        builder: (BuildContext ctx, state) {
              PickImageCubit pickImageCubit = PickImageCubit.get(ctx);

          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: ListView(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: CircleAvatar(
                    radius: 70,
                    child:pickImageCubit.url!=null? Image.network(
                      pickImageCubit.url!,
                      // width: 150,
                      // height: 150,
                    ):Image.asset('assets/images/Main_Image/no_image.jpg'),
                  ),
                ),
                TextButton(
                  onPressed: () async {
                    await pickImageCubit.pickImage();
                  },
                  child: Text('pick image'),
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextFormField(
                  textInputType: TextInputType.name,
                  lable: ' Name',
                  obscureText: false,
                  onPressed: () {},
                  validator: (val) {},
                  onSaved: (val) {},
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextFormField(
                  textInputType: TextInputType.name,
                  lable: ' Status',
                  obscureText: false,
                  onPressed: () {},
                  validator: (val) {},
                  onSaved: (val) {},
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextFormField(
                  textInputType: TextInputType.name,
                  lable: 'Active',
                  obscureText: false,
                  onPressed: () {},
                  validator: (val) {},
                  onSaved: (val) {},
                  suffixIcon: Icons.arrow_drop_down,
                ),
                const SizedBox(
                  height: 60,
                ),
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
                    Navigator.pop(context);
                  },
                  child: Text('Complete'),
                ),
              ],
            ),
          );
        },
        listener: (BuildContext context, Object? state) {},
      ),
    );
  }
}
