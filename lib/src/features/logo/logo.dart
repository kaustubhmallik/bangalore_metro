import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Logo extends StatelessWidget {
  const Logo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 75, 0, 0),
          child: Center(
            child: Image.asset(
              'assets/logos/metro.png',
              height: 76,
              width: 131,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
          child: Text(
            'Travel Safe',
            style: GoogleFonts.playball(
              textStyle: const TextStyle(
                fontStyle: FontStyle.italic,
                fontSize: 18,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
