import 'package:bonfire/bonfire.dart';
import 'package:darkness_dungeon/main.dart';
import 'package:darkness_dungeon/player/knight.dart';
import 'package:darkness_dungeon/util/game_sprite_sheet.dart';
import 'package:darkness_dungeon/util/localization/strings_location.dart';
import 'package:flutter/cupertino.dart';

import '../util/custom_sprite_animation_widget.dart';
import '../util/player_sprite_sheet.dart';

class GreenDoor extends GameDecoration with ObjectCollision {
  bool open = false;
  bool showDialog = false;

  GreenDoor(Vector2 position, Vector2 size)
      : super.withSprite(
          sprite: Sprite.load('items/door_closed_green.png'),
          position: position,
          size: size,
        ) {
    setupCollision(
      CollisionConfig(
        collisions: [
          CollisionArea.rectangle(
            size: Vector2(width, height / 4),
            align: Vector2(0, height * 0.75),
          ),
        ],
      ),
    );
  }

  @override
  void update(double dt) {
    super.update(dt);
    if (gameRef.player != null) {
      this.seeComponent(
        gameRef.player!,
        observed: (player) {
          if (!open) {
            Knight p = player as Knight;
            if (p.greenContainKey == true) {
              open = true;
              gameRef.add(
                AnimatedObjectOnce(
                  animation: GameSpriteSheet.openTheDoor(),
                  position: this.position,
                  onFinish: () {
                    p.greenContainKey = false;
                  },
                  size: Vector2(2 * tileSize, 2 * tileSize),
                ),
              );
              Future.delayed(Duration(milliseconds: 200), () {
                removeFromParent();
              });
            } else {
              if (!showDialog) {
                showDialog = true;
              }
            }
          }
        },
        notObserved: () {
          showDialog = false;
        },
        radiusVision: (1.5 * tileSize),
      );
    }
  }
}
