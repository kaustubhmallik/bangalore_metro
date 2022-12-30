import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../ticket/buy_ticket.dart';
import 'tile.dart';

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
