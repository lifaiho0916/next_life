import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mylife/main.dart';
import 'package:mylife/constants.dart';
import 'package:google_fonts/google_fonts.dart';

class PathFinderPage extends StatefulWidget {
  const PathFinderPage({
    required this.onGoToPage,
    super.key,
  });

  /// The action to go to target page when tap,
  final bool Function(int) onGoToPage;

  @override
  State<PathFinderPage> createState() => _PathFinderPageState();
}

class _PathFinderPageState extends State<PathFinderPage> {
  late final TextEditingController _surveyController;

  @override
  void initState() {
    super.initState();
    _surveyController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child)
    {
      final themeMode = ref.watch(themeModeProvider);
      Color textColor = themeMode == 0 ? Colors.black : Colors.white;
      Color backgroundColor = themeMode == 0 ? lightTheme
          .scaffoldBackgroundColor : darkTheme.scaffoldBackgroundColor;

      return WillPopScope(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget> [
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
                  const SizedBox(height: 60.0,),
                  const Text(
                    'Survey topic',
                    style: TextStyle(
                      color: Color(0xFF414C57),
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 15.0),
                  TextField(
                    controller: _surveyController,
                    maxLines: 10,
                    style: TextStyle(color: textColor),
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(15.0),
                      fillColor: backgroundColor,
                      filled: true,
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color(0xFF7EBEB2)),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(color: Color(0xFF7EBEB2))),
                      focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Color(0xFF7EBEB2)),
                          borderRadius: BorderRadius.circular(8)),
                      hintText: 'Enter the topic of your survey',
                      hintStyle: TextStyle(
                        color: const Color(0x414C5766).withOpacity(0.4),
                        fontSize: 15,
                      ),
                    ),
                    onChanged: (value) {},
                  ),
                ],
              ),
              GestureDetector(
                onTap: () async {
                  FocusScope.of(context).unfocus();
                  widget.onGoToPage(10);
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
                    'Begin survey',
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
        onWillPop: () async {
          return widget.onGoToPage(-1);
        },
      );
    });
  }
}
