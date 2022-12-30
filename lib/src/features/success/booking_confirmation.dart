import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../logo/logo.dart';

class BookingConfirmation extends StatelessWidget {
  const BookingConfirmation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          const Logo(),
          Padding(
              padding: const EdgeInsets.fromLTRB(0, 30, 0, 30),
              child: Image.asset(
                'assets/images/success.png',
                height: 165,
                width: 175,
              )),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 30, 0, 0),
            child: Text(
              'Tickets Booked Successfully',
              style: GoogleFonts.roboto(
                textStyle: const TextStyle(
                  fontSize: 20,
                  color: Colors.purple, // TODO: use theme to set text color
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
