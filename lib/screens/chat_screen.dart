import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   elevation: 0,
      //   backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      //   leading: IconButton(
      //     onPressed: () {},
      //     icon: Icon(
      //       Icons.search,
      //       color: Colors.black,
      //     ),
      //   ),
      //   actions: [
      //   ],
      // ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15,vertical: 15),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset('assets/images/Main_Image/User_Active.png'),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.search_sharp,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              Row(
//mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}


