 abstract class SendMessageStates{}

class SendMessageInit extends SendMessageStates{}
class SendMessageSuccess extends SendMessageStates{}
class SendMessageFailuer extends SendMessageStates {
  final String errorMessage;
  SendMessageFailuer({
    required this.errorMessage,
  });
}

