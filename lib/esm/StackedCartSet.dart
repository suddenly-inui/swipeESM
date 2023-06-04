import 'StackedCard.dart';

class StackedCardSet {
  final List<StackedCard> cards;

  int _currentCardIndex = 0;

  /// `StackedCard`のリストを受け取ります
  StackedCardSet({
    required this.cards,
  });

  /// 現在参照しているカードのインデックス（先頭のカード）を変更します
  /// 次のカードがあれば次へ、なければ先頭へ戻します
  void incrementCardIndex() {
    _currentCardIndex =
        _currentCardIndex < cards.length - 1 ? _currentCardIndex + 1 : 0;
  }

  /// 先頭のカードを返却します
  StackedCard getFirstCard() {
    return cards[_currentCardIndex];
  }

  /// 2番目のカードを返却します
  StackedCard getNextCard() {
    return _currentCardIndex < cards.length - 1
        ? cards[_currentCardIndex + 1]
        : cards[0];
  }

  /// 先頭のカードの識別子となる文字列を返却します
  /// ここではtitleを返却するようにしています
  String getKey() {
    return getFirstCard().title;
  }
}
