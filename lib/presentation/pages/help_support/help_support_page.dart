import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:next_life/main.dart';
import 'package:next_life/constants.dart';

class HelpSupportPage extends StatefulWidget {
  const HelpSupportPage({
    required this.onGoToPage,
    super.key,
  });

  /// The action to go to target page when tap,
  final bool Function(int) onGoToPage;

  @override
  State<HelpSupportPage> createState() => _HelpSupportPageState();
}

class _HelpSupportPageState extends State<HelpSupportPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child)
    {
      final themeMode = ref.watch(themeModeProvider);
      Color backgroundColor = themeMode == 0 ? lightTheme
          .scaffoldBackgroundColor : darkTheme.scaffoldBackgroundColor;
      return WillPopScope(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  width: double.maxFinite,
                  height: 315,
                  padding: const EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    color: backgroundColor,
                    shape: BoxShape.rectangle,
                    border: Border.all(color: const Color(0xFFBDDED8)),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Column(
                    children: <Widget>[
                      const Text(
                        'Help and Support',
                        style: TextStyle(
                          color: Color(0xFF414C57),
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      GestureDetector(
                        onTap: () async {},
                        child: Container(
                          height: 42,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: const Color(0xFF237A6A),
                            shape: BoxShape.rectangle,
                            border: Border.all(
                              color: const Color(0xFF7EBEB2),
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: const Text(
                            'Privacy policy',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      GestureDetector(
                        onTap: () async {},
                        child: Container(
                          height: 42,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: const Color(0xFF237A6A),
                            shape: BoxShape.rectangle,
                            border: Border.all(
                              color: const Color(0xFF7EBEB2),
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: const Text(
                            'Terms and conditions',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      GestureDetector(
                        onTap: () async {},
                        child: Container(
                          height: 42,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: const Color(0xFF237A6A),
                            shape: BoxShape.rectangle,
                            border: Border.all(
                              color: const Color(0xFF7EBEB2),
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: const Text(
                            'Discord',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      GestureDetector(
                        onTap: () async {},
                        child: Container(
                          height: 42,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: const Color(0xFF237A6A),
                            shape: BoxShape.rectangle,
                            border: Border.all(
                              color: const Color(0xFF7EBEB2),
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: const Text(
                            'Contact us',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        onWillPop: () async {
          return widget.onGoToPage(-1);
        },
      );
    });
  }
}
