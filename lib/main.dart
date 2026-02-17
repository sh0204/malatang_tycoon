import 'package:flutter/material.dart';
import 'package:flame/game.dart';

void main() {
  runApp(GameWidget(game: MalatangTycoonGame()));
}

class MalatangTycoonGame extends FlameGame {
  @override
  Future<void> onLoad() async {
    // TODO: Implement game loading logic here
    return super.onLoad();
  }
}
