import 'package:flutter/material.dart';
import 'package:next_life/data/constants/color.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PersonalizeHelpScreen extends StatelessWidget {
  const PersonalizeHelpScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      return SafeArea(
        child: Scaffold(
          backgroundColor: BGColor.bgColor,
          body: Container(
            padding: const EdgeInsets.all(15.0),
            child: const Column(
              children: <Widget>[
                Text('Below is a personalized plan to get to your next life',
                  style: TextStyle(
                    fontFamily: 'Joti One',
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                  ),
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}