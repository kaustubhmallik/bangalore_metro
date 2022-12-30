import 'package:bangalore_metro/src/features/logo/logo.dart';
import 'package:bangalore_metro/src/features/otp/otp_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final phoneNumController = TextEditingController();

  bool showLogin = false;
  bool? invalidNum;

  @override
  void dispose() {
    // destructor that's why destroy objects in reverse order of creation
    phoneNumController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(children: [
        const Logo(),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 100, 200, 0),
          child: Text(
            'LOGIN/SIGNUP',
            style: GoogleFonts.roboto(
              textStyle: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 192, 0),
          child: Text(
            'WITH PHONE NUMBER',
            style: GoogleFonts.roboto(
              textStyle: const TextStyle(
                fontSize: 14,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
          child: TextField(
            // autofocus: true,
            controller: phoneNumController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(
                  width: 1,
                  color: invalidNum == true ? Colors.red : Colors.black,
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide.none,
              ),
              // focusColor: ,
              filled: true,
              fillColor: const Color(0xffE8E8E8),
              hintText: 'ENTER YOUR PHONE NUMBER',
            ),
            onChanged: _verifyPhoneNumber,
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 42, 0, 0),
          child: ElevatedButton(
            onPressed: showLogin ? _submitLogin : null,
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(350, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Text(
              'LOGIN',
              style: GoogleFonts.roboto(
                textStyle: const TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 23, 0, 0),
          child: Text(
            'By clicking, I accept the Terms & Condition.',
            style: GoogleFonts.roboto(
              textStyle: const TextStyle(
                fontSize: 15,
              ),
            ),
          ),
        ),
        Padding(
            padding: const EdgeInsets.fromLTRB(0, 23, 0, 0),
            child: Text(
              'SKIP',
              style: GoogleFonts.roboto(
                textStyle: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ))
      ]),
    );
  }

  void _submitLogin() {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return const OtpPage();
    }));
  }

  void _verifyPhoneNumber(String number) {
    if (number.isEmpty || number.length == 10) {
      setState(() {
        invalidNum = false;
        showLogin = true;
      });
    } else {
      setState(() {
        invalidNum = true;
        showLogin = false;
      });
    }
  }
}
