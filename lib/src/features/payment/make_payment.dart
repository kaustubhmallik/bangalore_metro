import 'package:bangalore_metro/src/features/success/booking_confirmation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../logo/logo.dart';

class MakePayment extends StatefulWidget {
  const MakePayment({Key? key}) : super(key: key);

  @override
  State<MakePayment> createState() => _MakePaymentState();
}

class _MakePaymentState extends State<MakePayment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          const Logo(),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 30, 0, 0),
            child: Text(
              'Summary',
              style: GoogleFonts.roboto(
                textStyle: const TextStyle(
                  fontSize: 20,
                  color: Colors.purple, // TODO: use theme to set text color
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
            child: Divider(
              thickness: 1,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 30, 0),
                child: Text(
                  'Indiranagar',
                  style: GoogleFonts.roboto(
                    textStyle: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              const Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: Icon(Icons.arrow_forward_rounded)),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
                child: Text('Kormangala',
                    style: GoogleFonts.roboto(
                      textStyle: const TextStyle(
                        fontSize: 16,
                      ),
                    )),
              )
            ],
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: Divider(
              thickness: 1,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: Text(
                  'Tickets:',
                  style: GoogleFonts.roboto(
                    textStyle: const TextStyle(
                      fontSize: 16,
                      // fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(30, 10, 0, 0),
                child: Text('2'),
              )
            ],
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: Divider(
              thickness: 1,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: Text('Total Amount:',
                    style: GoogleFonts.roboto(
                      textStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 10, 0, 0),
                child: Text('\u{20B9} 40/-',
                    style: GoogleFonts.roboto(
                      textStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
            child: Text(
              'Payment Mode',
              style: GoogleFonts.roboto(
                textStyle: const TextStyle(
                  fontSize: 20,
                  color: Colors.purple, // TODO: use theme to set text color
                ),
              ),
            ), // TODO: create separate payment widget
          ),
          // const Padding(
          //   padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
          //   child: Divider(
          //     thickness: 1,
          //   ),
          // ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
            child: OutlinedButton(
              onPressed: _bookingConfirmation,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(110, 0, 0, 0),
                    child: Image.asset(
                      'assets/images/gpay_icon.png',
                      height: 40,
                      width: 70,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: Text('Google Pay'),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: OutlinedButton(
              onPressed: _bookingConfirmation,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(110, 0, 0, 0),
                    child: Image.asset(
                      'assets/images/paytm_icon.png',
                      height: 40,
                      width: 70,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: Text('Paytm'),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: OutlinedButton(
              onPressed: _bookingConfirmation,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(110, 0, 0, 0),
                    child: Image.asset(
                      'assets/images/card_icon.png',
                      height: 40,
                      width: 70,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: Text('Credit/Debit Card'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _bookingConfirmation() {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return const BookingConfirmation();
    }));
  }
}
