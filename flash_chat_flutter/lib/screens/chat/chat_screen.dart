import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/components/logo.dart';
import 'package:flash_chat/constants/firestore_collection.dart';
import 'package:flash_chat/constants/route.dart';
import 'package:flash_chat/screens/chat/message.dart';
import 'package:flash_chat/screens/chat/input.dart';
import 'package:flash_chat/types/message.dart';
import 'package:flutter/material.dart';
import 'package:loading_overlay/loading_overlay.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  User? _user;
  String? _userName;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    if (_auth.currentUser != null) {
      _user = _auth.currentUser!;
      _userName = _user!.displayName ?? _user!.email ?? 'unknow';
      setState(() => _isLoading = false);
    } else {
      Navigator.popAndPushNamed(context, RouteConstants.welcome);
    }
  }

  void _handleSendMessage(String message) {
    _firestore.collection(FirestoreCollectionConstants.messages).add({
      'text': message,
      'sender': _userName,
      'date': DateTime.now(),
    });
  }

  void _handleLogout() {
    setState(() {
      _isLoading = true;
    });
    _auth.signOut();
    Navigator.popAndPushNamed(context, RouteConstants.welcome);
  }

  Widget _renderMessages() {
    return StreamBuilder<QuerySnapshot>(
      stream: _firestore
          .collection(FirestoreCollectionConstants.messages)
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.data != null) {
          final messages = snapshot.data!.docs
              .map((e) => Message.fromJson(e))
              .toList()
                ..sort((e1, e2) => e1.date.compareTo(e2.date));

          return ListView(
            reverse: true,
            children: messages.reversed.map(
              (message) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 0,
                    vertical: 8,
                  ),
                  child: ChatMessage(
                    message: message,
                    isMe: message.sender == _userName,
                  ),
                );
              },
            ).toList(),
          );
        }
        return Center(
          child: CircularProgressIndicator(
            backgroundColor: Colors.lightBlueAccent,
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.close),
            onPressed: _handleLogout,
          ),
        ],
        title: Row(
          children: [
            Logo(
              height: 35.0,
            ),
            Text('Chat'),
          ],
        ),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: LoadingOverlay(
        isLoading: _isLoading,
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 8,
                  ),
                  child: _renderMessages(),
                ),
              ),
              ChatMessageInput(
                onSend: _handleSendMessage,
              )
            ],
          ),
        ),
      ),
    );
  }
}
