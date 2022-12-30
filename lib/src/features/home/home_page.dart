import 'package:bangalore_metro/src/features/home/home_page_row.dart';
import 'package:bangalore_metro/src/features/home/tile.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:basic_utils/basic_utils.dart';
import "package:flutter/services.dart" as s;

import '../logo/logo.dart';
import '../ticket/buy_ticket.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final firstRow = [
    Tile('Buy Virtual Ticket', 'assets/images/buy_ticket.png', true,
        const BuyTicket()),
    Tile('Recharge Card', 'assets/images/recharge_icon.png', false, null),
  ];`

  final secondRow = [
    Tile('Map', 'assets/images/map_icon.png', false, null),
    Tile('Route and Fare', 'assets/images/recharge_icon.png', false, null),
  ];

  final thirdRow = [
    Tile('Helpline', 'assets/images/help_icon.png', false, null),
  ];

  Future<void> loadMap() async {
    mapContent = await s.rootBundle.loadString('assets/maps/map.yaml');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(children: [
        const Logo(),
        HomePageRow(tiles: firstRow),
        HomePageRow(tiles: secondRow),
        HomePageRow(tiles: thirdRow),
      ]),
    );
  }
}
