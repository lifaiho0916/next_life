// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:next_life/data/init_data.dart';
import 'package:next_life/constants.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:next_life/transfer.dart';



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
  var hintText = '';
  bool isLoading = true;


  @override
  void initState() {
    super.initState();
    safePrint('Constructor');
    _surveyController = TextEditingController(text: sendData.survey);
    getDataWhatTheyLike();
  }

  Future<void> getDataWhatTheyLike() async {
    setState(() {
      isLoading = true; // Show loading spinner
    });
    bool result = await getDataWhatTheyLikeFromAWS();

    if (result) {
      setState(() {
        hintText = sendData.hintText;
        isLoading = false;
      });
    } else {
        setState(() {
          isLoading = false; // Hide loading spinner in case of error
        });
    }
  }

  Widget buildLoadingWidget() {
    return const Center(
        child:Column(
          children: [
            SizedBox(height: 300.0,),
            CircularProgressIndicator(),
          ],
        ) // You can customize this widget as needed
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child)
    {
      final themeMode = sendData.theme;
      Color textColor = themeMode == 0 ? Colors.black : Colors.white;
      Color backgroundColor = themeMode == 0 ? lightTheme
          .scaffoldBackgroundColor : darkTheme.scaffoldBackgroundColor;

      return WillPopScope(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              if (isLoading) buildLoadingWidget(),
              if (!isLoading) Column(
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
                  Text(
                    'Survey topic',
                    style: TextStyle(
                      color: textColor,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 15.0),
                  TextField(
                    controller: _surveyController,
                    maxLines: 5,
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
                      hintText: hintText,
                      hintStyle: TextStyle(
                        color: const Color(0x414C5766).withOpacity(0.4),
                        fontSize: 15,
                      ),
                    ),
                    onChanged: (value) {},
                  ),
                ],
              ),
              if (!isLoading) GestureDetector(
                onTap: () async {
                  FocusScope.of(context).unfocus();
                  widget.onGoToPage(10);
                  sendData.survey = _surveyController.text;
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
                  child: Text(
                    'Begin survey',
                    style: TextStyle(
                      color: textColor,
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
