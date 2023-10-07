
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
  void dispose() {
    
    super.dispose();
    chatController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            maxLines: 3,
           enableSuggestions: true,
            controller: chatController,
            decoration: InputDecoration(
              
              
              suffixIcon: IconButton(
                onPressed: () {
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
                    fontWeight: FontWeight.w500,),
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
