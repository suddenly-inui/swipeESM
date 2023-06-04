import 'package:flutter/material.dart';
import 'package:swipe_esm/esm/StackedCardView.dart';

import 'CardSetter.dart';
import 'StackedCartSet.dart';

final cardSetter = CardSetter();
final StackedCardSet cards = cardSetter.card_set;

class EsmHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StackedCardView(
      cardSet: cards,
    );
  }
}
