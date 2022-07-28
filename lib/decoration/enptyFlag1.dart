import 'package:bonfire/bonfire.dart';
import 'package:darkness_dungeon/decoration/potion_life.dart';
import 'package:darkness_dungeon/enemies/goblin.dart';
import 'package:darkness_dungeon/main.dart';
import 'package:darkness_dungeon/util/game_sprite_sheet.dart';
import 'package:flutter/material.dart';

import '../enemies/imp.dart';
import '../player/knight.dart';
import 'flagDoor.dart';

class EmptyFlag1 extends GameDecoration with Lighting {
  bool flag = false;
  EmptyFlag1(Vector2 position, {this.flag = false})
      : super.withAnimation(
          animation: GameSpriteSheet.torch(),
          position: position,
          size: Vector2.all(tileSize),
        ) {
    setupLighting(
      LightingConfig(
        radius: width * 2.5,
        blurBorder: width,
        pulseVariation: 0.1,
        color: Colors.deepOrangeAccent.withOpacity(0.2),
      ),
    );
  }

  @override
  void render(Canvas canvas) {
    if (gameRef.player != null) {
      this.seeComponent(
        gameRef.player!,
        observed: (player) async {
          if (!flag) {
            flag = true;
            addDoor();
            addDoor2();
            addGoblin(6400, 4425);
            await Future.delayed(Duration(milliseconds: 1500));
            addGoblin(5900, 4425);
            await Future.delayed(Duration(milliseconds: 2000));
            addGoblin(6400, 4962);
            addPotion();
          }
        },
        radiusVision: (1.5 * tileSize),
      );
    }
  }

  void addDoor() {
    double dx = 5475;
    double dy = 4623;
    gameRef.add(
      AnimatedObjectOnce(
        animation: GameSpriteSheet.smokeExplosion(),
        position: Vector2(
          dx,
          dy,
        ),
        size: Vector2(32, 32),
      ),
    );
    gameRef.add(FlagDoor(Vector2(dx, dy), size * 2));
  }

  void addPotion() {
    double dx = this.x;
    double dy = this.y;
    gameRef.add(
      AnimatedObjectOnce(
        animation: GameSpriteSheet.smokeExplosion(),
        position: Vector2(
          dx,
          dy,
        ),
        size: Vector2(32, 32),
      ),
    );
    gameRef.add(PotionLife(Vector2(dx, dy), 100));
  }

  void addDoor2() {
    double dx = 6807;
    double dy = 4623;
    gameRef.add(
      AnimatedObjectOnce(
        animation: GameSpriteSheet.smokeExplosion(),
        position: Vector2(
          dx,
          dy,
        ),
        size: Vector2(32, 32),
      ),
    );
    gameRef.add(FlagDoor(Vector2(dx, dy), size * 2));
  }

  void addGoblin(double x, double y) {
    gameRef.add(
      AnimatedObjectOnce(
        animation: GameSpriteSheet.smokeExplosion(),
        position: Vector2(x, y),
        size: Vector2(32, 32),
      ),
    );
    gameRef.add(Goblin(
      Vector2(x, y),
    ));
  }

  void addImp(double x, double y) {
    gameRef.add(
      AnimatedObjectOnce(
        animation: GameSpriteSheet.smokeExplosion(),
        position: Vector2(x, y),
        size: Vector2(32, 32),
      ),
    );
    gameRef.add(Imp(
      Vector2(x, y),
    ));
  }
}
