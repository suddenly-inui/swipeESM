import 'package:flutter/material.dart';

import 'StackedCard.dart';
import 'StackedCardViewItem.dart';
import 'StackedCartSet.dart';
import 'utils.dart';

class StackedCardView extends StatefulWidget {
  final StackedCardSet? cardSet;

  const StackedCardView({
    super.key,
    this.cardSet,
  });

  @override
  _StackedCardViewState createState() => _StackedCardViewState();
}

class _StackedCardViewState extends State<StackedCardView> {
  /// 後ろに描写されるカードのスケールを操作するための変数
  double _nextCardScale = 0.0;

  Key? _frontItemKey;

  @override
  void initState() {
    super.initState();

    _setItemKey();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: getChild(),
        )
      ],
    );
  }

  /// 先頭カードのWidgetに設定するキーを更新します
  void _setItemKey() {
    _frontItemKey = Key(widget.cardSet!.getKey());
  }

  /// 先頭のカードがスワイプされた際、移動距離に応じてバックに配置されているカードのスケールを変更します
  void _onSlideUpdate(double distance) {
    setState(() {
      _nextCardScale = 0.9 + (0.1 * (distance / 100.0)).clamp(0.0, 0.1);
    });
  }

  /// スワイプ操作が完了した際に呼び出されます
  void _onSlideComplete(SlideDirection direction) {
    /*

    ここに方向のプログラム

    */
    switch (direction) {
      case SlideDirection.Left:
        onSwipe("left");
        break;
      case SlideDirection.Right:
        onSwipe("right");
        break;
      case SlideDirection.Up:
        onSwipe("up");
        break;
    }

    /// カードのインデックスを次の番号へ変更
    /// 確実に再レンダリングさせるため`Key`を更新して状態変更を通知
    setState(() {
      widget.cardSet!.incrementCardIndex();
      _setItemKey();
    });
  }

  /// 後ろのカード（2枚目）を生成します
  /// 後ろのカードはドラッグが出来ないように制御します
  Widget _buildBackItem() {
    return StackedCardViewItem(
        isDraggable: false,
        card: widget.cardSet!.getNextCard(),
        scale: _nextCardScale);
  }

  /// 先頭のカード（1枚目）を生成します
  /// Widgetが再レンダリングされる際に確実に更新されるよう、`key`を渡します
  Widget _buildFrontItem() {
    return StackedCardViewItem(
      key: _frontItemKey,
      onSlideUpdate: _onSlideUpdate,
      onSlideComplete: _onSlideComplete,
      card: widget.cardSet!.getFirstCard(),
    );
  }

  /// 先頭のカード（1枚目）とその背後のカード（2枚目）を生成します
  Widget getChild() {
    return Stack(
      textDirection: TextDirection.rtl,
      children: <Widget>[
        _buildBackItem(),
        _buildFrontItem(),
      ],
    );
  }
}
