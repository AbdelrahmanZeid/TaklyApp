import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:takly/constants/app_constant.dart';
import 'package:takly/cubits/send_messsage_cubit/send_message_cubit.dart';
import 'package:takly/cubits/send_messsage_cubit/send_message_state.dart';
import 'package:takly/screens/chat_screen.dart';

class SendMessage extends StatelessWidget {
  SendMessage({super.key});

  TextEditingController chatController = TextEditingController();
  @override
  @override
  Widget build(BuildContext context) {
    return BlocListener<SendMessageCubit, SendMessageStates>(
      listener: (BuildContext context, state) {
        if (state is SendMessageSuccess) {
          print('success');
        } else if (state is SendMessageFailuer) {
          print('fai');
        }
      },
      child: Row(
        children: [
          Expanded(
            child: TextField(
              enableSuggestions: true,
              controller: chatController,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  onPressed: () {
                    SendMessageCubit.get(context).addData(
                      messageText: chatController.text,
                    );
                    FocusScope.of(context).unfocus();
                    chatController.clear();
                    scroll.animateTo(
                      0,
                      duration: Duration(milliseconds: 800),
                      curve: Curves.easeIn,
                    );
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
      ),
    );
  }
}
