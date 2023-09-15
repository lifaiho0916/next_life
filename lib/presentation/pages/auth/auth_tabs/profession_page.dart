// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfessionPage extends StatefulWidget {
  final Function goToNextPage;
  const ProfessionPage({Key? key, required this.goToNextPage})
      : super(key: key);

  @override
  _ProfessionPageState createState() => _ProfessionPageState();
}

class _ProfessionPageState extends State<ProfessionPage> {
  bool work = true;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.all(20),
      margin: EdgeInsets.only(top: size.height * 0.12, bottom: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: size.width,
                child: Text(
                  "Do you work or go to school?",
                  style: GoogleFonts.jotiOne(
                    fontSize: 30,
                    color: const Color.fromRGBO(41, 137, 119, 1),
                    letterSpacing: 4,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              // two radio buttons (yes, no) each with label (yes, no) and must use real radio buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Radio(
                    fillColor: MaterialStateProperty.all(
                      const Color.fromRGBO(35, 122, 106, 1),
                    ),
                    value: true,
                    groupValue: work,
                    onChanged: (value) {
                      setState(() {
                        work = value as bool;
                      });
                    },
                  ),
                  const Text("Yes"),
                  Radio(
                    value: false,
                    fillColor: MaterialStateProperty.all(
                      const Color.fromRGBO(35, 122, 106, 1),
                    ),
                    groupValue: work,
                    onChanged: (value) {
                      setState(() {
                        work = value as bool;
                      });
                    },
                  ),
                  const Text("No"),
                ],
              ),
            ],
          ),
          GestureDetector(
            onTap: () async {
              widget.goToNextPage();
            },
            child: Container(
              height: 45,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: const Color(0xFF237A6A),
                shape: BoxShape.rectangle,
                border: null,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: const Text(
                'Next',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
