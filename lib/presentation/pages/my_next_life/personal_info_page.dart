import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:next_life/data/init_data.dart';
import 'package:next_life/constants.dart';
import 'package:google_fonts/google_fonts.dart';

class PersonalInfoNextLifePage extends StatefulWidget {
  const PersonalInfoNextLifePage({Key? key}) : super(key: key);

  @override
  State<PersonalInfoNextLifePage> createState() => _PersonalInfoNextLifePageState();
}

class _PersonalInfoNextLifePageState extends State<PersonalInfoNextLifePage> {
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      final themeMode = sendData.theme;
      Color backgroundColor = themeMode == 0 ? lightTheme
          .scaffoldBackgroundColor : darkTheme.scaffoldBackgroundColor;
      Color textColor = themeMode == 0 ? Colors.black : Colors.white;
      return SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const SizedBox(height: 20.0),
            SizedBox(
              child: Text(
                "First answer the question below",
                style: GoogleFonts.jotiOne(
                  fontSize: 30,
                  color: const Color.fromRGBO(41, 137, 119, 1),
                  letterSpacing: 4,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 50.0),
            Container(
              padding: const EdgeInsets.all(20),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: backgroundColor,
                shape: BoxShape.rectangle,
                border: Border.all(
                  color: const Color(0xFF84C1B6),
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Username',
                            style: TextStyle(
                              color: textColor,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 3.0),
                          const Text(
                            'Rohan01',
                            style: TextStyle(
                              color: Color(0xFF237A6A),
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Text(
                            'Age',
                            style: TextStyle(
                              color: textColor,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 3.0),
                          const Text(
                            '24 years',
                            style: TextStyle(
                              color: Color(0xFF237A6A),
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 18.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'E-mail',
                            style: TextStyle(
                              color: textColor,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 3.0),
                          const Text(
                            'Rohan01@mail.com',
                            style: TextStyle(
                              color: Color(0xFF237A6A),
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Text(
                            'Gender',
                            style: TextStyle(
                              color: textColor,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 3.0),
                          const Text(
                            'Male',
                            style: TextStyle(
                              color: Color(0xFF237A6A),
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 18.0),
                  Container(
                    height: 1,
                    decoration: const BoxDecoration(
                      color: Color(0xFFBDDED8),
                      shape: BoxShape.rectangle,
                    ),
                  ),
                  const SizedBox(height: 18.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Twitter',
                        style: TextStyle(
                          color: textColor,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const Text(
                        'Add account',
                        style: TextStyle(
                          color: Color(0xFF237A6A),
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 18.0),
                  Container(
                    height: 1,
                    decoration: const BoxDecoration(
                      color: Color(0xFFBDDED8),
                      shape: BoxShape.rectangle,
                    ),
                  ),
                  const SizedBox(height: 18.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Facebook',
                        style: TextStyle(
                          color: textColor,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const Text(
                        'Add account',
                        style: TextStyle(
                          color: Color(0xFF237A6A),
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 18.0),
                  Container(
                    height: 1,
                    decoration: const BoxDecoration(
                      color: Color(0xFFBDDED8),
                      shape: BoxShape.rectangle,
                    ),
                  ),
                  const SizedBox(height: 18.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Instagram',
                        style: TextStyle(
                          color: textColor,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const Text(
                        'Add account',
                        style: TextStyle(
                          color: Color(0xFF237A6A),
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 18.0),
                  Container(
                    height: 1,
                    decoration: const BoxDecoration(
                      color: Color(0xFFBDDED8),
                      shape: BoxShape.rectangle,
                    ),
                  ),
                  const SizedBox(height: 18.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'TikTok',
                        style: TextStyle(
                          color: textColor,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const Text(
                        'Add account',
                        style: TextStyle(
                          color: Color(0xFF237A6A),
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 18.0),
                  Container(
                    height: 1,
                    decoration: const BoxDecoration(
                      color: Color(0xFFBDDED8),
                      shape: BoxShape.rectangle,
                    ),
                  ),
                  const SizedBox(height: 21.0),
                  GestureDetector(
                    onTap: () async {},
                    child: Container(
                      width: 145,
                      height: 39,
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
      );
    });
  }
}
