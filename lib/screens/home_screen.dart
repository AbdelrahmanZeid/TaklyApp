import 'package:flutter/material.dart';
import 'package:takly/screens/chat_screen.dart';
import 'package:takly/screens/profile_screen.dart';
import 'package:takly/widgets/custom_chat_call_item.dart';
import 'package:takly/widgets/custom_chat_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const routeName = 'homescreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back_ios,
            size: 20,
          ),
        ),
        title: Text(
          'Chats',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(
                context,
                ProfileScreen.routeName,
              );
            },
            icon: Icon(Icons.settings),
          ),
        ],
      ),
      body: HomeScreenBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(
        context,
        ChatScreen.routeName,
      );
        },
        child: Icon(
          Icons.message,
        ),
      ),
    );
  }
}

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18),
      child: ListView(
        children: [
          CustomChatCallItem(),
          const SizedBox(
            height: 15,
          ),
          CustomChatItem(
            image: 'assets/images/Main_Image/User_50px.png',
            title: 'Annette Black',
            subTitle: 'hay did you talk to her',
          ),
        ],
      ),
    );
  }
}




