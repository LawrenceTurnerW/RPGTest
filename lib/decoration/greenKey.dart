import 'package:bonfire/bonfire.dart';
import 'package:darkness_dungeon/decoration/door.dart';
import 'package:darkness_dungeon/main.dart';
import 'package:darkness_dungeon/player/knight.dart';

import '../util/game_sprite_sheet.dart';
import 'flagDoor.dart';

class GreenKey extends GameDecoration with Sensor {
  GreenKey(Vector2 position)
      : super.withSprite(
          sprite: Sprite.load('items/key_green.png'),
          position: position,
          size: Vector2(tileSize, tileSize),
        );

  @override
  void onContact(GameComponent collision) {
    if (collision is Knight) {
      collision.greenContainKey = true;
      collision.migidoa = true;
      removeFromParent();
    }
  }
}
