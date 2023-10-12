import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:takly/constants/app_constant.dart';

class SendMessage extends StatefulWidget {
  const SendMessage({super.key});

  @override
  State<SendMessage> createState() => _SendMessageState();
}

class _SendMessageState extends State<SendMessage> {
  TextEditingController chatController = TextEditingController();
  @override
  CollectionReference message =
      FirebaseFirestore.instance.collection('messages');

  void dispose() {
    super.dispose();
    chatController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            enableSuggestions: true,
            controller: chatController,
            decoration: InputDecoration(
              suffixIcon: IconButton(
                onPressed: () {
                  message.add({
                    'message': chatController,
                    'createdAt': DateTime.now(),
                  });
                  FocusScope.of(context).unfocus();
                  chatController.clear();
                },
                icon: Icon(
                  Icons.send,
                  color: kPrimaryColor,
                ),
              ),
              label: Text(
                'Message',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
