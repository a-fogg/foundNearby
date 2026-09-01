import 'package:flutter/material.dart';

class ConversationScreen extends StatefulWidget {
  final String listingId;
  final String sellerId;

  const ConversationScreen({
    Key? key,
    required this.listingId,
    required this.sellerId,
  }) : super(key: key);

  @override
  State<ConversationScreen> createState() => _ConversationScreenState();
}

class _ConversationScreenState extends State<ConversationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Conversation')),
      body: Center(
        child: Text('Conversation Coming Soon'),
      ),
    );
  }
}
