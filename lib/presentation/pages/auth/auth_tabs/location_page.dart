// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:next_life/data/init_data.dart';

class ZipCodePage extends StatefulWidget {
  final Function goToNextPage;
  const ZipCodePage({Key? key, required this.goToNextPage}) : super(key: key);

  @override
  _ZipCodePageState createState() => _ZipCodePageState();
}

class _ZipCodePageState extends State<ZipCodePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    TextEditingController location = TextEditingController();
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
                  "Where do you live?",
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
              const SizedBox(
                width: double.infinity,
                child: Text(
                  "Location",
                  style: TextStyle(fontSize: 15),
                  textAlign: TextAlign.left,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: location,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(color: Colors.grey),
                    gapPadding: 10,
                  ),
                  // add background color
                  filled: true,
                ),
              )
            ],
          ),
          GestureDetector(
            onTap: () async {
              sendData.location = location.text;
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
