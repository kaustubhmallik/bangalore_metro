import 'package:bangalore_metro/src/features/home/home_page_tile.dart';
import 'package:flutter/material.dart';

import 'tile.dart';

class HomePageRow extends StatelessWidget {
  const HomePageRow({Key? key, required this.tiles}) : super(key: key);

  final List<Tile> tiles;

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: tiles.map((e) => HomePageTile(tile: e)).toList());
  }
}
