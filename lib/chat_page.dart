
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  final String language;
  final String model;

  ChatPage({required this.language, required this.model});

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _controller = TextEditingController();
  final List<Map<String, String>> _messages = [];

  void sendMessage() {
    String message = _controller.text.trim();
    if (message.isEmpty) return;

    setState(() {
      _messages.add({"role": "user", "text": message});
      _messages.add({"role": "ai", "text": "Reply from ${widget.model} (mocked)"});
      _controller.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("${widget.model} - ${widget.language}")),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                var msg = _messages[index];
                return ListTile(
                  title: Text(msg["text"] ?? ""),
                  subtitle: Text(msg["role"] ?? ""),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(child: TextField(controller: _controller)),
                IconButton(icon: Icon(Icons.send), onPressed: sendMessage)
              ],
            ),
          )
        ],
      ),
    );
  }
}
