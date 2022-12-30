import 'package:bangalore_metro/src/features/home/home_page.dart';
import 'package:bangalore_metro/src/features/logo/logo.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpPage extends StatefulWidget {
  const OtpPage({Key? key}) : super(key: key);

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  bool showSubmit = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(children: [
          const Logo(),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 100, 200, 0),
            child: Text(
              'VERIFY DETAILS',
              style: GoogleFonts.roboto(
                textStyle: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 180, 0),
            child: Text(
              'OTP SENT TO 7683053838',
              style: GoogleFonts.roboto(
                textStyle: const TextStyle(
                  fontSize: 14,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: PinCodeTextField(
              appContext: context,
              length: 4,
              onChanged: _checkSubmitEligibility,
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.underline,
                // borderRadius: BorderRadius.circular(5),
                fieldHeight: 50,
                fieldWidth: 80,
                activeFillColor: Colors.grey[50],
                activeColor: Colors.grey[50],
                inactiveColor: Colors.black,
                selectedColor: Colors.grey,
                inactiveFillColor: Colors.grey[50],
                selectedFillColor: Colors.grey[50],
                disabledColor: Colors.grey[50],
              ),
              cursorColor: Colors.black,
              animationType: AnimationType.fade,
              animationDuration: const Duration(milliseconds: 300),
              enableActiveFill: true,
              showCursor: true,
              keyboardType: TextInputType.number,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 42, 0, 0),
            child: ElevatedButton(
              onPressed: showSubmit ? _submitOtp : null,
              style: ElevatedButton.styleFrom(
                  minimumSize: const Size(350, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  )),
              child: Text(
                'SUBMIT OTP',
                style: GoogleFonts.roboto(
                  textStyle: const TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.fromLTRB(125, 20, 0, 0),
          //   child: Text(
          //     'Didn\'t receive the OTP? VIA CALL',
          //     style: GoogleFonts.roboto(
          //       textStyle: const TextStyle(
          //         fontSize: 15,
          //       ),
          //     ),
          //   ),
          // ),
        ]));
  }

  void _submitOtp() {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return const HomePage();
    }));
  }

  void _checkSubmitEligibility(String value) {
    setState(() {
      showSubmit = value.length == 4 ? true : false;
    });
  }
}
