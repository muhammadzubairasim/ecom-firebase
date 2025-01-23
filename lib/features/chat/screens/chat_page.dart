import 'package:ecom/features/chat/model/chat_model.dart';
import 'package:ecom/features/chat/screens/custom_chat_tile.dart';
import 'package:flutter/material.dart';

class chat_page extends StatelessWidget {
  const chat_page({super.key, required this.chat_models,required this.sourceChat});
  final List<ChatModel> chat_models;
  final ChatModel sourceChat;


  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigator.push(context,
          //     MaterialPageRoute(builder: (builder) => SelectContact()));
        },
        child: Icon(
          Icons.chat,
          color: Colors.white,
        ),
      ),
      body: ListView.builder(
        itemCount: chat_models.length,
        itemBuilder: (contex, index) => custom_chat_tile(
          chatModel: chat_models[index],
          sourceChat: sourceChat,
        ),
      ),
    );
  }
}
