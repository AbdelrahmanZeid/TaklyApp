import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:takly/cubits/send_messsage_cubit/send_message_cubit.dart';
import 'package:takly/models/message_model.dart';
 
import '../widgets/message_bubble.dart';
import '../widgets/send_message.dart';

final scroll = ScrollController();

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});
  static const routeName = 'chatscreen';

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  CollectionReference message =
      FirebaseFirestore.instance.collection('messages');

  @override
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: message.orderBy('createdAt', descending: true).snapshots(),
        builder: (context, snapshot) {
          List<Message> messageList = [];
          if (snapshot.hasData) {
            for (int i = 0; i < snapshot.data!.docs.length; i++) {
              messageList.add(
                Message.fromjson(
                  snapshot.data!.docs[i],
                ),
              );
            }
            return Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: false,
                title: Image.asset(
                  'assets/images/Main_Image/Talky_2.png',
                  width: 80,
                  height: 40,
                ),
                centerTitle: true,
              ),
              body: SafeArea(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 8,
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          reverse: true,
                          controller: scroll,
                          itemBuilder: (context, index) {
                            return messageList[index].id == id
                                ? MessageBubble(
                                    message: messageList[index],
                                  )
                                : MessageBubbleForFriend(
                                    message: messageList[index],
                                  );
                          },
                          itemCount: messageList.length,
                        ),
                      ),
                      Card(
                        elevation: 15,
                        child: SendMessage(),
                      ),
                    ],
                  ),
                ),
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
