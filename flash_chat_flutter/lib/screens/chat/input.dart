import 'package:flash_chat/constants/decoration.dart';
import 'package:flash_chat/constants/text_style.dart';
import 'package:flutter/material.dart';

class ChatMessageInput extends StatefulWidget {
  final void Function(String message) onSend;

  const ChatMessageInput({
    Key? key,
    required this.onSend,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ChatMessageInputState();
}

class _ChatMessageInputState extends State<ChatMessageInput> {
  final TextEditingController textEditingController = TextEditingController();

  void _handleSendMessage() {
    widget.onSend(textEditingController.text);
    _cleanText();
  }

  void _cleanText() {
    setState(() {
      textEditingController.text = '';
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: DecorationConstants.messageContainerDecoration,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: TextField(
              controller: textEditingController,
              decoration: DecorationConstants.messageTextFieldDecoration,
            ),
          ),
          TextButton(
            onPressed: _handleSendMessage,
            child: Text(
              'Send',
              style: TextStyleConstants.sendButtonTextStyle,
            ),
          ),
        ],
      ),
    );
  }
}
