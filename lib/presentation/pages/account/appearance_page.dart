import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:next_life/data/init_data.dart';
import 'package:next_life/constants.dart';
import 'package:next_life/pages.dart';
import 'package:next_life/transfer.dart';

class AppearancePage extends StatefulWidget {
  const AppearancePage({
    required this.onGoToPage,
    super.key,
  });

  /// The action to go to target page when tap,
  final bool Function(int) onGoToPage;

  @override
  State<AppearancePage> createState() => _AppearancePageState();
}

class _AppearancePageState extends State<AppearancePage> {
  late int _selectedMode;

  @override
  void initState() {
    super.initState();
    _selectedMode = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {

      final themeMode = sendData.theme;
      _selectedMode = themeMode;
      Color backgroundColor = themeMode==0? lightTheme.scaffoldBackgroundColor:darkTheme.scaffoldBackgroundColor;
      Color textColor = themeMode == 0 ? Colors.black : Colors.white;

      return WillPopScope(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  width: double.maxFinite,
                  height: 365,
                  padding: const EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    color: backgroundColor,
                    shape: BoxShape.rectangle,
                    border: Border.all(color: const Color(0xFFBDDED8)),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Column(
                    children: <Widget>[
                      Text(
                        'Appearance',
                        style: TextStyle(
                          color: textColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 30.0),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            GestureDetector(
                              onTap: () {
                                sendData.theme = 0;
                                sendUserInfoToAWS();
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(builder: (BuildContext context) => const BasePage()),
                                );
                              },
                              child: Column(
                                children: <Widget>[
                                  Image.asset('assets/meta/light_mode.png'),
                                  Radio(
                                    value: 0,
                                    groupValue: _selectedMode,
                                    activeColor: const Color(0xFF298977),
                                    focusColor: const Color(0xFF298977),
                                    onChanged: (value) {
                                      setSelectedModeValue(value ?? 0);
                                      sendData.theme = 0;
                                    },
                                  ),
                                  Text(
                                    'Light mode',
                                    style: TextStyle(
                                      color: textColor,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                sendData.theme = 1;
                                sendUserInfoToAWS();
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(builder: (BuildContext context) => const BasePage()),
                                );
                              },
                              child: Column(
                                children: <Widget>[
                                  Image.asset('assets/meta/dark_mode.png'),
                                  Radio(
                                    value: 1,
                                    groupValue: _selectedMode,
                                    activeColor: const Color(0xFF298977),
                                    focusColor: const Color(0xFF298977),
                                    onChanged: (value) {
                                      setSelectedModeValue(value ?? 1);
                                      sendData.theme = 1;
                                    },
                                  ),
                                  Text(
                                    'Dark mode',
                                    style: TextStyle(
                                      color: textColor,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      GestureDetector(
                        onTap: () async {
                          widget.onGoToPage(2);
                        },
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
                            'Save',
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

  setSelectedModeValue(int value) {
    setState(() {
      _selectedMode = value;
    });
  }
}
