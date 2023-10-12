class Message {
  final String message;

  Message({required this.message});

  factory Message.fromjson(jsonData) {
    return Message(
      message: jsonData['message'],
    );
  }
}
