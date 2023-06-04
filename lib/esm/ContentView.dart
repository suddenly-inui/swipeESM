import 'package:flutter/material.dart';

import 'QuestionContent.dart';

class ContentView extends StatefulWidget {
  final String text;
  final int id;
  final String title;

  const ContentView({super.key, required this.text, required this.id, required this.title});

  @override
  _ContentViewState createState() => _ContentViewState();
}

class _ContentViewState extends State<ContentView> {
  late String questionContent;
  late int id;
  late String title;

  @override
  void initState() {
    super.initState();
    questionContent = widget.text;
    id = widget.id;
    title = widget.title;
  }

  @override
  Widget build(BuildContext context) {
    return QuestionContent(text: questionContent, id: id, title: title);
  }
}
