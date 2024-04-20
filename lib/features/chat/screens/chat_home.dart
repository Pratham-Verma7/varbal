import 'package:flutter/material.dart';
import 'package:someone_datingapp/features/videocall/call.dart';
import 'package:someone_datingapp/utils/data.dart';
import 'package:someone_datingapp/widgets/chat_item.dart';
import 'package:someone_datingapp/widgets/custom_textfield.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold( // Wrap content with Scaffold
      appBar: AppBar(
        title: Text("Chat"),
        actions: [ // Add actions for right corner
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => MyCall(callID: "1")),
              );
            },
            child: Text("Join Call"),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            _buildHeader(),
            _buildChats(),
          ],
        ),
      ),
    );
  }

  _buildHeader() {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 60, 0, 5),
      child: Column(
        children: [
          Text(
            "Chat",
            style: TextStyle(
              fontSize: 28,
              color: Colors.black87,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 15),
          CustomTextBox(
            hint: "Search",
            prefix: Icon(
              Icons.search,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  _buildChats() {
    return ListView(
      padding: EdgeInsets.only(top: 10),
      shrinkWrap: true,
      children: List.generate(
        chats.length,
            (index) => ChatItem(
          chats[index],
        ),
      ),
    );
  }
}
