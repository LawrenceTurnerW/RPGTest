import 'package:bonfire/bonfire.dart';
import 'package:darkness_dungeon/main.dart';
import 'package:darkness_dungeon/player/knight.dart';

class RedKey extends GameDecoration with Sensor {
  RedKey(Vector2 position)
      : super.withSprite(
          sprite: Sprite.load('items/key_red.png'),
          position: position,
          size: Vector2(tileSize, tileSize),
        );

  @override
  void onContact(GameComponent collision) {
    if (collision is Knight) {
      collision.redContainKey = true;
      removeFromParent();
    }
  }
}
