import 'package:bangalore_metro/src/features/payment/make_payment.dart';
import 'package:basic_utils/basic_utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import "package:flutter/services.dart" as s;
import "package:yaml/yaml.dart";

import '../logo/logo.dart';

class BuyTicket extends StatefulWidget {
  const BuyTicket({Key? key, this.locationsData}) : super(key: key);

  final String? locationsData;

  @override
  State<BuyTicket> createState() => _BuyTicketState();
}

class _BuyTicketState extends State<BuyTicket> {
  int ticketCount = 0;
  int costPerTicket = 20;
  late String mapContent;
  late YamlMap map;
  late List<String> locations = [];
  String? srcStn;
  String? dstStn;

  Future<void> loadMap() async {
    if (widget.locationsData != null) {
      map = loadYaml(widget.locationsData!);
      locations = map.keys.map((e) => e.toString()).toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    loadMap();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(children: [
        const Logo(),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: SizedBox(
                  width: 120,
                  child: Column(
                    children: [
                      DropdownButton<String>(
                        value: srcStn,
                        icon: const Icon(Icons.arrow_downward_rounded),
                        elevation: 16,
                        style: const TextStyle(fontSize: 18),
                        underline: Container(
                          height: 2,
                        ),
                        onChanged: (String? value) {
                          setState(() {
                            srcStn = value;
                          });
                        },
                        items: locations
                            .map<DropdownMenuItem<String>>(
                                (e) => DropdownMenuItem(
                                      value: e,
                                      child: Text(e),
                                    ))
                            .toList(),
                      )
                    ],
                  ),
                ),
              ),
              OutlinedButton(
                onPressed: swapStations,
                style: OutlinedButton.styleFrom(
                  shape: const CircleBorder(),
                ),
                child: const Icon(Icons.sync_alt),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: SizedBox(
                  width: 120,
                  child: Column(
                    children: [
                      DropdownButton<String>(
                        value: dstStn,
                        icon: const Icon(Icons.arrow_downward_rounded),
                        elevation: 16,
                        style: const TextStyle(fontSize: 18),
                        underline: Container(
                          height: 2,
                        ),
                        onChanged: (String? value) {
                          setState(() {
                            dstStn = value;
                          });
                        },
                        items: locations
                            .map<DropdownMenuItem<String>>(
                                (e) => DropdownMenuItem(
                                      value: e,
                                      child: Text(e),
                                    ))
                            .toList(),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 50, 0, 0),
          child: Row(
            children: [
              Text(
                'Cost Per Ticket:',
                style: GoogleFonts.roboto(
                  textStyle: const TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(120, 0, 0, 0),
                child: Text(
                  '\u{20B9} $costPerTicket/-',
                  style: GoogleFonts.roboto(
                    textStyle: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 50, 0, 0),
          child: Row(
            children: [
              Text(
                'Number of Tickets:',
                style: GoogleFonts.roboto(
                  textStyle: const TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
                child: OutlinedButton(
                  onPressed: ticketCount > 0 ? _decrementTicketCount : null,
                  style: OutlinedButton.styleFrom(
                    shape: const CircleBorder(),
                  ),
                  child: const Icon(Icons.remove),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                child: Text(ticketCount.toString()),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                child: OutlinedButton(
                  onPressed: ticketCount < 6 ? _incrementTicketCount : null,
                  style: OutlinedButton.styleFrom(
                    shape: const CircleBorder(),
                  ),
                  child: const Icon(Icons.add),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 50, 0, 0),
          child: Row(
            children: [
              Text(
                'Total Amount:',
                style: GoogleFonts.roboto(
                  textStyle: const TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(130, 0, 0, 0),
                child: Text(
                  '\u{20B9} ${ticketCount * costPerTicket}/-',
                  style: GoogleFonts.roboto(
                    textStyle: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(10, 50, 10, 0),
          child: SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                textStyle: const TextStyle(fontSize: 20),
              ),
              onPressed: ticketCount > 0 ? _makePayment : null,
              child: const Text('Buy Tickets'),
            ),
          ),
        ),
      ]),
    );
  }

  void _makePayment() {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return const MakePayment();
    }));
  }

  void swapStations() {
    setState(() {
      final source = srcStn;
      srcStn = dstStn;
      dstStn = source;
    });
  }

  void _incrementTicketCount() {
    setState(() {
      ticketCount++;
    });
  }

  void _decrementTicketCount() {
    setState(() {
      ticketCount--;
    });
  }
}
