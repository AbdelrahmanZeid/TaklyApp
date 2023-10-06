import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:takly/constants/app_constant.dart';
import 'package:takly/screens/sign_in_screen.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        // backgroundColor: Theme.of(context).scaffoldBackgroundColor,

        actions: [
          Text(
            'Log out',
            style: TextStyle(
                color: Colors.red, fontWeight: FontWeight.bold, fontSize: 16),
          ),
          IconButton(
            onPressed: () async {
              GoogleSignIn().disconnect();
              final firebase = await FirebaseAuth.instance;
              firebase.signOut();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return SignInScreen();
                  },
                ),
              );
            },
            icon: Icon(
              Icons.logout_outlined,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 15),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    'Annette Black',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Container(
                      width: 62,
                      height: 62,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                            'assets/images/Main_Image/User_Active.png',
                          ),
                        ),
                      ),
                      child: null),
                ],
              ),
              Expanded(
                child: ChatBody(),
              ),
              SendMessage(),
            ],
          ),
        ),
      ),
    );
  }
}

class ChatBody extends StatelessWidget {
  const ChatBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class SendMessage extends StatefulWidget {
  const SendMessage({super.key});

  @override
  State<SendMessage> createState() => _SendMessageState();
}

class _SendMessageState extends State<SendMessage> {
  TextEditingController chatController = TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    chatController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            controller: chatController,
            decoration: InputDecoration(
              label: Text(
                'Enter your message',
                style: TextStyle(color: Colors.grey, fontSize: 14),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
        IconButton(
          onPressed: () {
            FocusScope.of(context).unfocus();
            chatController.clear();
          },
          icon: Icon(Icons.send),
        ),
      ],
    );
  }
}
