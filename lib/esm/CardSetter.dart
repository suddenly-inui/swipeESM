import 'StackedCard.dart';
import 'StackedCartSet.dart';

class CardSetter {
  List<StackedCard> cards = [
    StackedCard(id: 1, title: "sampleA", text: "aaa"),
    StackedCard(id: 2, title: "sampleB", text: "bbb"),
    StackedCard(
      id: 3,
      title: "sampleC",
      text: "ccc",
    ),
  ];

  StackedCardSet get card_set {
    return StackedCardSet(cards: cards);
  }

  /// これはイベントリスなを実装しないと動かないよ
  void makeCards(int id, String title, String text) {
    StackedCard card = StackedCard(id: id, title: title, text: text);
    cards.add(card);
  }
}
