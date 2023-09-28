// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:next_life/data/init_data.dart';

class AgePage extends StatefulWidget {
  final Function goToNextPage;
  const AgePage({Key? key, required this.goToNextPage}) : super(key: key);

  @override
  _AgePageState createState() => _AgePageState();
}

class _AgePageState extends State<AgePage> {
  List<int> ages = List.generate(100, (index) => index + 1);

  int selectedAge = 1;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.all(20),
      margin: EdgeInsets.only(top: size.height * 0.12, bottom: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: size.width,
                  child: Text(
                    "How old are you?",
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
                Container(
                  height: 200,
                  width: size.width,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(229, 240, 238, 1),
                    border: Border.all(
                      color: const Color.fromRGBO(35, 122, 106, 1),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: CupertinoPicker(
                    itemExtent: 30,
                    scrollController: FixedExtentScrollController(
                      initialItem: 1,
                    ),
                    children: [
                      for (int age in ages)
                        Text(
                          "$age",
                          style: GoogleFonts.jotiOne(
                            fontSize: 20,
                            color: const Color.fromRGBO(41, 137, 119, 1),
                            letterSpacing: 4,
                          ),
                          textAlign: TextAlign.left,
                        ),
                    ],
                    onSelectedItemChanged: (int value) {
                      setState(() {
                        selectedAge = ages[value];
                      });
                    },
                  ),
                )
              ],
            )
          ),
          GestureDetector(
            onTap: () async {
              FocusScope.of(context).unfocus();
              sendData.age = selectedAge;
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
