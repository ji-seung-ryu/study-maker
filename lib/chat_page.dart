import 'package:flutter/material.dart';

import 'CustomUI/custom_card.dart';
import 'model/chat_model.dart';

class ChatPage extends StatefulWidget {
  ChatPage({required this.chatmodels, required this.sourchat});
  final List<ChatModel> chatmodels;
  final ChatModel sourchat;

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          /*
          Navigator.push(context,
              MaterialPageRoute(builder: (builder) => SelectContact()));*/
        },
        child: Icon(
          Icons.chat,
          color: Colors.white,
        ),
      ),
      body: ListView.builder(
        itemCount: widget.chatmodels.length,
        itemBuilder: (contex, index) =>
            CustomCard(
              chatModel: widget.chatmodels[index],
              sourchat: widget.sourchat,
            ),
      ),
    );
  }
}