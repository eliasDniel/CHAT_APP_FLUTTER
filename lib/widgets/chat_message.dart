import 'package:flutter/material.dart';

class ChatMessage extends StatelessWidget {
  final String message;
  final String uuid;
  final AnimationController animationController;
  const ChatMessage({
    super.key,
    required this.message,
    required this.uuid,
    required this.animationController,
  });

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: animationController,
      child: SizeTransition(
        sizeFactor: CurvedAnimation(
          parent: animationController,
          curve: Curves.easeOut,
        ),
        child: Container(
          child: uuid == '123'
              ? MyMessage(message: message)
              : const OpponentMessage(),
        ),
      ),
    );
  }
}

class OpponentMessage extends StatelessWidget {
  const OpponentMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.only(bottom: 5, right: 50, left: 5),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Color(0xffE4E5E8),
          borderRadius: BorderRadius.circular(10),
        ),
        child: const Text(
          'Opponenet message',
          style: TextStyle(color: Colors.black87),
        ),
      ),
    );
  }
}

class MyMessage extends StatelessWidget {
  final String message;
  const MyMessage({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        margin: const EdgeInsets.only(bottom: 5, left: 50, right: 5),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Color(0xff4D9EF6),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(message, style: const TextStyle(color: Colors.white)),
      ),
    );
  }
}
