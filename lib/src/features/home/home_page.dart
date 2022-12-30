import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// import 'package:basic_utils/basic_utils.dart';
// import "package:flutter/services.dart" as s;

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
  ];

  final secondRow = [
    Tile('Map', 'assets/images/map_icon.png', false, null),
    Tile('Route and Fare', 'assets/images/recharge_icon.png', false, null),
  ];

  final thirdRow = [
    Tile('Helpline', 'assets/images/help_icon.png', false, null),
  ];

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

class HomePageTile extends StatefulWidget {
  const HomePageTile({Key? key, required this.tile}) : super(key: key);

  final Tile tile;

  @override
  State<HomePageTile> createState() => _HomePageTileState();
}

class _HomePageTileState extends State<HomePageTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: InkWell(
        borderRadius: BorderRadius.circular(15),
        child: Ink(
          color: Colors.white,
          child: OutlinedButton(
            onPressed: () {
              if (widget.tile.onClickWidget != null) {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return widget.tile.onClickWidget!;
                }));
              }
            },
            style: OutlinedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Image.asset(
                    widget.tile.iconPath,
                    height: 60,
                    width: 70,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    widget.tile.title,
                    style: GoogleFonts.roboto(
                      textStyle: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        // color: Colors.purple,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Tile {
  final String title;
  final String iconPath;
  final bool enableClick;
  late Widget? onClickWidget;

  Tile(this.title, this.iconPath, this.enableClick, this.onClickWidget);
}
