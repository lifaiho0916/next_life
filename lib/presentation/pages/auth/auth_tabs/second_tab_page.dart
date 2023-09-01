import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:flutter_svg/flutter_svg.dart";
import "package:google_fonts/google_fonts.dart";

class SecondTabPage extends StatelessWidget {
  const SecondTabPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.all(20),
      margin:  EdgeInsets.only(top: size.height * 0.12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: size.width,
            child: Text(
              "Let's start with few of your life details",
              style: GoogleFonts.jotiOne(
                  fontSize: 30,
                  color: const Color.fromRGBO(41, 137, 119, 1),
                  letterSpacing: 4,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          SvgPicture.asset(
            "assets/meta/Illustration.svg",
          ),
        ],
      ),
    );
  }
}
