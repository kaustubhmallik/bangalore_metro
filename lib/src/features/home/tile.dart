import 'package:flutter/material.dart';

class Tile {
  final String title;
  final String iconPath;
  final bool enableClick;
  final String? mapContent;
  late Widget? onClickWidget;

  Tile(this.title, this.iconPath, this.enableClick, this.onClickWidget,
      this.mapContent);
}
