import 'package:flutter/material.dart';
import 'package:takly/screens/chat_screen.dart';

class CustomChatItem extends StatelessWidget {
  const CustomChatItem(
      {super.key,
      required this.image,
      required this.title,
      required this.subTitle});
  final String image;
  final String title;
  final String subTitle;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(
        context,
        ChatScreen.routeName,
      ),
      child: Row(
    
        children: [
          Image.asset(
            image,
          ),
          const SizedBox(width: 5,),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
              ),
              Text(
                subTitle,
                style: TextStyle(
                  color: Color(0xff58616A),
                  fontSize: 15,
                ),
              ),
            ],
          ),
          const SizedBox(width: 110,),
          Text('2 min'),
        ],
      ),
      
    );
  }
}