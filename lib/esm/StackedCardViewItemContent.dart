import 'package:flutter/material.dart';

import 'ContentView.dart';
import 'StackedCard.dart';

class StackedCardViewItemContent extends StatelessWidget {
  final StackedCard? card;

  const StackedCardViewItemContent({
    Key? key,
    this.card,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return getChild();
  }

  Widget getChild() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 5.0,
              spreadRadius: 2.0,
            )
          ]),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: Material(
          child: Stack(
            textDirection: TextDirection.rtl,
            fit: StackFit.expand,
            children: <Widget>[
              ContentView(
                text: card!.text,
                id: card!.id,
                title: card!.title
              )
            ],
          ),
        ),
      ),
    );
  }
}
