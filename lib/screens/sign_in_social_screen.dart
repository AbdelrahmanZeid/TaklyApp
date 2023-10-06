 
// import 'package:flutter/material.dart';
// import 'package:takly/constants/app_constant.dart';

// import 'package:takly/screens/sign_up_screen.dart';

// import '../widgets/custom_text_form_field.dart';

// class SignInSocialScreen extends StatefulWidget {
//   const SignInSocialScreen({super.key, required this.socialName});

//   static const routeName = 'LoginSocialScreen';
//   final String socialName;

//   @override
//   State<SignInSocialScreen> createState() => _SignInSocialScreenState();
// }

// class _SignInSocialScreenState extends State<SignInSocialScreen> {
//   @override
//   bool isviasable = true;

//   String userEmail = '';
//   String userPassword = '';
//   final formKey = GlobalKey<FormState>();
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Theme.of(context).scaffoldBackgroundColor,
//         elevation: 0,
//         leading: Row(
//           children: [
//             const SizedBox(
//               width: 5,
//             ),
//             IconButton(
//               icon: Icon(
//                 Icons.arrow_back_ios,
//                 size: 22,
//                 color: Colors.black,
//               ),
//               onPressed: () => Navigator.pop(context),
//             ),
//           ],
//         ),
//       ),
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 15),
//           child: SingleChildScrollView(
//             child: Form(
//               key: formKey,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   Center(
//                     child: Image.asset(
//                       'assets/images/Main_Image/Talky_2.png',
//                       width: 135,
//                       height: 135,
//                     ),
//                   ),
//                   Text(
//                     'Sign in with ${widget.socialName}',
//                     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
//                   ),
//                   const SizedBox(
//                     height: 35,
//                   ),
//                   CustomTextFormField(
//                     lable: 'Enter your ${widget.socialName} address',
//                     textInputType: TextInputType.emailAddress,
//                     obscureText: false,
//                     onPressed: () {},
//                     validator: (String? value) {
//                       if (value!.isEmpty) {
//                         return 'Email should not be empty';
//                       } else if (!value.contains('@')) {
//                         return 'Email should contain @';
//                       } else
//                         return null;
//                     },
//                     onSaved: (value) {
//                       if (value!.isNotEmpty) {
//                         userEmail = value;
//                       }
//                     },
//                   ),
//                   const SizedBox(
//                     height: 20,
//                   ),
//                   CustomTextFormField(
//                     lable: 'Enter your password',
//                     suffixIcon: isviasable == false
//                         ? Icons.visibility
//                         : Icons.visibility_off,
//                     textInputType: TextInputType.visiblePassword,
//                     obscureText: isviasable,
//                     onPressed: () {
//                       setState(() {
//                         isviasable = !isviasable;
//                       });
//                     },
//                     validator: (String? value) {
//                       if (value!.isEmpty) {
//                         return 'Password should not be empty';
//                       } else if (value.length < 7) {
//                         return 'Password should at least 7 char';
//                       } else
//                         return null;
//                     },
//                     onSaved: (value) {
//                       if (value!.isNotEmpty) {
//                         userPassword = value;
//                       }
//                     },
//                   ),
//                   const SizedBox(
//                     height: 10,
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: [
//                       const SizedBox(
//                         width: 25,
//                       ),
//                       Text(
//                         'Forget password ?',
//                         style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(
//                     height: 160,
//                   ),
//                   ElevatedButton(
//                     onPressed: () {
//                       if (formKey.currentState!.validate()) {
//                         formKey.currentState!.save();
                          
                        
//                       }
                      
//                     },
//                     child: Text(
//                       'Sign in ',
//                     ),
//                     style: ElevatedButton.styleFrom(
//                       minimumSize: Size(340, 58),
//                       elevation: 5,
//                       backgroundColor: kPrimaryColor,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 20,
//                   ),
//                   Text(
//                     'Already have an account ?',
//                     style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                   ),
//                   TextButton(
//                     onPressed: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) {
//                             return SignUpScreen(socialName: '',);
//                           },
//                         ),
//                       );
//                     },
//                     child: Text(
//                       'Sign up here',
//                       style: TextStyle(
//                           color: kPrimaryColor,
//                           fontWeight: FontWeight.bold,
//                           fontSize: 16),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
