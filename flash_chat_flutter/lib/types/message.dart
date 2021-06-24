import 'package:cloud_firestore/cloud_firestore.dart';

class Message {
  final String sender;
  final String text;
  final DateTime date;

  Message({
    required this.sender,
    required this.text,
    required this.date,
  });

  factory Message.fromJson(dynamic json) {
    return Message(
      sender: json['sender'],
      text: json['text'],
      date: (json['date'] as Timestamp).toDate(),
    );
  }
}
