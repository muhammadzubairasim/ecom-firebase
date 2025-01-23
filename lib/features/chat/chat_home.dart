import 'package:ecom/features/chat/controller/chat_controller.dart';
import 'package:ecom/features/chat/model/chat_model.dart';
import 'package:ecom/features/chat/screens/custom_chat_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class chat_home extends StatelessWidget {
  chat_home({super.key,});

  final chat_controller _controller =Get.put(chat_controller());

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chat App"),
        actions: [
          IconButton(icon: Icon(Icons.search), onPressed: () {}),
          PopupMenuButton<String>(
            onSelected: (value) {
              print(value);
            },
            itemBuilder: (BuildContext contesxt) {
              return [
                PopupMenuItem(
                  child: Text("New group"),
                  value: "New group",
                ),
                PopupMenuItem(
                  child: Text("New broadcast"),
                  value: "New broadcast",
                ),
                PopupMenuItem(
                  child: Text("Whatsapp Web"),
                  value: "Whatsapp Web",
                ),
                PopupMenuItem(
                  child: Text("Starred messages"),
                  value: "Starred messages",
                ),
                PopupMenuItem(
                  child: Text("Settings"),
                  value: "Settings",
                ),
              ];
            },
          )
        ],
        bottom: TabBar(
          controller: _controller.tabController,
          indicatorColor: Colors.white,
          tabs: [
            Tab(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Home") ,
                  Icon(Icons.house)
                ],
              ),

            ),
            Tab(
              text: "STATUS",
            ),
            Tab(
              text: "CALLS",
            )
          ],
        ),
      ),
      body: TabBarView(
        controller: _controller.tabController,
        children: [
          custom_chat_tile(chatModel: ChatModel(name: "Rhodium tech " , currentMessage: "hey!" , status:"active" , select: false , id: 1), sourceChat: ChatModel(name: "Muhammad Zubair Asim" , currentMessage: "hey!" , status:"active" , select: false , id: 2),),
          Text("STATUS"),
          Text("Calls"),
        ],
      ),
    );
  }
}
