// ignore_for_file: library_private_types_in_public_api, file_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:next_life/transfer.dart';

class PathFindPage extends StatefulWidget {
  const PathFindPage({Key? key}) : super(key: key);

  @override
  _PathFindPageState createState() => _PathFindPageState();
}

class _PathFindPageState extends State<PathFindPage> {
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
                  "You are on your way! Let's find the best path for you",
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
            ],
          ),
          GestureDetector(
            onTap: () async {
              sendUserInfoToAWS();
              Navigator.pushNamed(context, "/");
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
