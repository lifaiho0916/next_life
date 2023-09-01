import 'package:flutter/material.dart';
import 'package:mylife/data/constants/color.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mylife/main.dart';
import 'package:mylife/constants.dart';

class PersonalizeHelpScreen extends StatelessWidget {
  const PersonalizeHelpScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      final themeMode = ref.watch(themeModeProvider);
      Color textColor = themeMode == 0 ? Colors.black : Colors.white;
      Color backgroundColor = themeMode == 0 ? lightTheme
          .scaffoldBackgroundColor : darkTheme.scaffoldBackgroundColor;
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