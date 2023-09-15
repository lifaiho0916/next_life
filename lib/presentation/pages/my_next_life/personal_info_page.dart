import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:next_life/main.dart';
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
    return Consumer(builder: (context, ref, child)
    {
      final themeMode = ref.watch(themeModeProvider);
      Color textColor = themeMode == 0 ? Colors.black : Colors.white;
      Color backgroundColor = themeMode == 0 ? lightTheme
          .scaffoldBackgroundColor : darkTheme.scaffoldBackgroundColor;

      return SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Column(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget> [
                  Container(
                    padding: const EdgeInsets.all(20.0),
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
                    child: const Text('',
                      style: TextStyle(height: 20),
                    ),
                  ),
                  const SizedBox(height: 35.0,),
                  GestureDetector(
                    onTap: () async {
                      // widget.onGoToPage(0);
                    },
                    child: Container(
                      height: 39,
                      width: MediaQuery.of(context).size.width * 0.3,
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
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: <Widget>[
                  //     Expanded(
                  //       flex: 3,
                  //       child: GestureDetector(
                  //         onTap: () async {
                  //           // widget.onGoToPage(0);
                  //         },
                  //         child: Container(
                  //           height: 39,
                  //           alignment: Alignment.center,
                  //           decoration: BoxDecoration(
                  //             color: const Color(0xFF237A6A),
                  //             shape: BoxShape.rectangle,
                  //             border: Border.all(
                  //               color: const Color(0xFF7EBEB2),
                  //               width: 2,
                  //             ),
                  //             borderRadius: BorderRadius.circular(10.0),
                  //           ),
                  //           child: const Text(
                  //             'Save',
                  //             style: TextStyle(
                  //               color: Colors.white,
                  //               fontSize: 14,
                  //               fontWeight: FontWeight.w500,
                  //             ),
                  //           ),
                  //         ),
                  //       ),
                  //     ),
                  //     SizedBox(
                  //       width: MediaQuery
                  //           .of(context)
                  //           .size
                  //           .width * 0.05,
                  //     ),
                  //     Expanded(
                  //       flex: 4,
                  //       child: GestureDetector(
                  //         onTap: () async {
                  //           // widget.onGoToPage(13);
                  //         },
                  //         child: Container(
                  //           height: 39,
                  //           alignment: Alignment.center,
                  //           decoration: BoxDecoration(
                  //             color: backgroundColor,
                  //             shape: BoxShape.rectangle,
                  //             border: Border.all(
                  //               color: const Color(0xFF84C1B6),
                  //               width: 1,
                  //             ),
                  //             borderRadius: BorderRadius.circular(10.0),
                  //           ),
                  //           child: const Text(
                  //             'Next',
                  //             style: TextStyle(
                  //               color: Color(0xFF237A6A),
                  //               fontSize: 14,
                  //               fontWeight: FontWeight.w500,
                  //             ),
                  //           ),
                  //         ),
                  //       ),
                  //     ),
                  //   ],
                  // )
                ],
              ),
            ],
          ),
        ),

      );

    });
  }
}
