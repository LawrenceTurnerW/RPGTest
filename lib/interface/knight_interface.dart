import 'dart:ui';

import 'package:bonfire/bonfire.dart';
import 'package:darkness_dungeon/interface/bar_life_component.dart';
import 'package:darkness_dungeon/player/knight.dart';
import 'package:flutter/material.dart';

class KnightInterface extends GameInterface {
  late Sprite key;
  late Sprite rkey;
  late Sprite gkey;

  @override
  Future<void> onLoad() async {
    key = await Sprite.load('items/key_silver.png');
    rkey = await Sprite.load('items/key_red.png');
    gkey = await Sprite.load('items/key_green.png');
    add(BarLifeComponent());
    return super.onLoad();
  }

  @override
  void render(Canvas canvas) {
    try {
      _drawKey(canvas);
    } catch (e) {}
    super.render(canvas);
  }

  void _drawKey(Canvas c) {
    if (gameRef.player != null && (gameRef.player as Knight).containKey) {
      key.renderRect(c, Rect.fromLTWH(150, 20, 35, 30));
    }
    if (gameRef.player != null && (gameRef.player as Knight).redContainKey) {
      rkey.renderRect(c, Rect.fromLTWH(200, 20, 35, 30));
    }
    if (gameRef.player != null && (gameRef.player as Knight).greenContainKey) {
      gkey.renderRect(c, Rect.fromLTWH(250, 20, 35, 30));
    }
  }
}
