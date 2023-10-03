import 'package:flutter/material.dart';
import 'package:takly/screens/sign_up_social_screen.dart';

class CustomButton extends StatelessWidget {
    CustomButton({super.key, required this.btnText, this.imagePath, required this.socialName,});
  final String btnText;
  final String? imagePath;
  final String socialName;

 
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: Size(322, 70),
        elevation: 5,
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12),),
      ),
      onPressed: () =>Navigator.push(context, MaterialPageRoute(builder: (context){
        return Sign_upSocialScreen(socialName: socialName);
      }),),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(imagePath!),
          Text(
            btnText,
            style: TextStyle(color: Colors.black, fontSize: 18),
          ),
        ],
      ),
    );
  }
}
