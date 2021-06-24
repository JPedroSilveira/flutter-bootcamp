import 'package:flash_chat/constants/text_style.dart';
import 'package:flash_chat/types/message.dart';
import 'package:flutter/material.dart';

class ChatMessage extends StatelessWidget {
  final Message message;
  final bool isMe;

  const ChatMessage({
    Key? key,
    required this.message,
    required this.isMe,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          isMe ? CrossAxisAlignment.start : CrossAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            bottom: 2,
            left: 16,
            right: 16,
          ),
          child: Text(
            isMe ? 'me' : message.sender,
            textAlign: TextAlign.start,
            style: TextStyleConstants.messageSender,
          ),
        ),
        Card(
          elevation: 5,
          color: isMe ? Colors.blue : Colors.green,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topRight: isMe ? Radius.circular(30) : Radius.zero,
              topLeft: isMe ? Radius.zero : Radius.circular(30),
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            ),
            child: Text(
              message.text,
              style: TextStyleConstants.messageText,
            ),
          ),
        ),
      ],
    );
  }
}
