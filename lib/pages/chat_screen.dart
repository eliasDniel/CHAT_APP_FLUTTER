import 'dart:io';

import 'package:app_chat_socket/widgets/chat_message.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> with TickerProviderStateMixin {
  final TextEditingController _textController = TextEditingController();
  final FocusNode focusNode = FocusNode();

  bool _isPosting = false;

  final List<ChatMessage> chatMessage = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Column(
          children: [
            CircleAvatar(
              maxRadius: 14,

              backgroundColor: Colors.blueAccent,
              child: Text('Te', style: TextStyle(fontSize: 12)),
            ),
            SizedBox(height: 3),
            Text(
              'David Ramos',
              style: TextStyle(fontSize: 12, color: Colors.black87),
            ),
          ],
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        child: Column(
          children: [
            Flexible(
              child: ListView.builder(
                padding: EdgeInsets.only(top: 10),
                reverse: true,
                physics: BouncingScrollPhysics(),
                itemCount: chatMessage.length,
                itemBuilder: (_, i) => chatMessage[i],
              ),
            ),
            Divider(height: 1),
            _inputChat(),
          ],
        ),
      ),
    );
  }

  Widget _inputChat() {
    return Container(
      decoration: BoxDecoration(color: Colors.white),
      child: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            children: [
              Flexible(
                child: TextField(
                  controller: _textController,
                  onSubmitted: handleSubmit,
                  decoration: InputDecoration.collapsed(
                    hintText: 'Enviar mensaje',
                  ),
                  focusNode: focusNode,

                  onChanged: (String text) {
                    setState(() {
                      if (text.trim().isEmpty) {
                        _isPosting = true;
                      } else {
                        _isPosting = false;
                      }
                    });
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 4.0),
                child: Platform.isIOS
                    ? CupertinoButton(
                        onPressed: _isPosting
                            ? null
                            : () => handleSubmit(_textController.text.trim()),

                        child: Text('Enviar'),
                      )
                    : IconTheme(
                        data: IconThemeData(color: Colors.blue[400]),
                        child: IconButton(
                          highlightColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          icon: Icon(Icons.send),
                          onPressed: _isPosting
                              ? null
                              : () => handleSubmit(_textController.text.trim()),
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void handleSubmit(String text) {
    if (text.isEmpty) return;
    _textController.clear();
    focusNode.requestFocus();

    final newMessage = ChatMessage(
      message: text,
      uuid: '123',
      animationController: AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 400),
      ),
    );
    chatMessage.insert(0, newMessage);

    newMessage.animationController.forward();
    setState(() {
      _isPosting = false;
    });
  }

  @override
  void dispose() {
    //* OFF SOCKETS

    //* Dispose animation controllers
    for (var message in chatMessage) {
      message.animationController.dispose();
    }
    super.dispose();
  }
}
