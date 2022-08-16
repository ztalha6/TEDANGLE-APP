import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/chat_controller.dart';

class ChatModel {
  final String message;
  final bool isFromSender;

  ChatModel(this.message, this.isFromSender);
}

class ChatView extends StatefulWidget {
  ChatView({Key? key}) : super(key: key);

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  TextEditingController messageController = TextEditingController();

  List<ChatModel> chats = [
    ChatModel('message', true),
    ChatModel('message', false),
    ChatModel('message', true),
    ChatModel('message', false)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF142F43),
      // appBar: AppBar(
      //   title: const Text('ChatView'),
      //   centerTitle: true,
      // ),
      body: Column(
        children: [
          Container(
            height: 100.0,
            color: Colors.transparent,
            child: Container(
                decoration: const BoxDecoration(
                    color: Color(0xFF00569E),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(40.0),
                      bottomRight: Radius.circular(40.0),
                    )),
                child: const Center(
                  child: Text(
                    "Java, Python",
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                    ),
                  ),
                )),
          ),
          SizedBox(
            height: 490,
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: chats.length,
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                itemBuilder: (BuildContext context, int index) {
                  return ChatBubble(
                      text: chats[index].message,
                      isFromSender: chats[index].isFromSender);
                }),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
            child: Row(
              children: [
                Container(
                  width: 270,
                  child: TextField(
                    controller: messageController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      filled: true,
                      hintStyle: TextStyle(color: Color(0xFFA6A6A6)),
                      hintText: "Type in your text",
                      fillColor: Color(0xFF004AAD),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(40)),
                    color: Color(0xFF004AAD),
                  ),
                  height: 60.0,
                  width: 60.0,
                  child: IconButton(
                    onPressed: () {
                      chats.add(ChatModel(messageController.text, true));
                      setState(() {});
                    },
                    icon: Icon(Icons.bolt, color: Color(0xFFFFC331)),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ChatBubble extends StatelessWidget {
  const ChatBubble({Key? key, required this.text, required this.isFromSender})
      : super(key: key);
  final String text;
  final bool isFromSender;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          isFromSender ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              color: Color(0xFF00569E),
            ),
            // height: 70.0,
            // width: 70.0,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(text),
            ),
          ),
        ),
      ],
    );
  }
}
