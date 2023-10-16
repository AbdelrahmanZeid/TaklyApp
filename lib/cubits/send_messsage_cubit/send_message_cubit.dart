import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:takly/cubits/send_messsage_cubit/send_message_state.dart';
import 'package:takly/models/message_model.dart';

var id = DateTime.now().millisecondsSinceEpoch;

class SendMessageCubit extends Cubit<SendMessageStates> {
  SendMessageCubit()
      : super(
          SendMessageInit(),
        );

  static SendMessageCubit get(context) => BlocProvider.of(context);

  List<Message> messageList = [];
  CollectionReference message =
      FirebaseFirestore.instance.collection('messages');
  addData({required String messageText}) {
    try {
      message.add({
        'message': messageText,
        'createdAt': DateTime.now(),
        'id': id,
      });

      emit(
        SendMessageSuccess(),
      );
    } catch (error) {
      emit(
        SendMessageFailuer(
          errorMessage: error.toString(),
        ),
      );
    }
  }

 
}
