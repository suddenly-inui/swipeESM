import 'package:flutter/material.dart';

class QuestionContent extends StatelessWidget {
  final String text;
  final int id;
  final String title;

  const QuestionContent(
      {Key? key, required this.text, required this.id, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(id.toString(), style: const TextStyle(fontSize: 16.0)),
        Text(title, style: const TextStyle(fontSize: 30.0)),
        Text(text, style: const TextStyle(fontSize: 16.0)),
      ],
    ));
  }
}
