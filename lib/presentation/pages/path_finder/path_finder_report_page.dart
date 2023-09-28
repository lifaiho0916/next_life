// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:next_life/data/init_data.dart';

import 'package:next_life/constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:amplify_flutter/amplify_flutter.dart';
import 'dart:convert';

class PathFinderReportPage extends StatefulWidget {
  const PathFinderReportPage({
    required this.onGoToPage,
    super.key,
  });

  /// The action to go to target page when tap,
  final bool Function(int) onGoToPage;


  @override
  State<PathFinderReportPage> createState() => _PathFinderReportPageState();
}


class _PathFinderReportPageState extends State<PathFinderReportPage> {
  late bool isLoading;
  List<String> answerResponse = [];
 
  @override
  void initState() {
    super.initState();
    getAnswerData();
    isLoading = true;
  }

  Future<void> getAnswerData() async {
    
    var data = {
      "prompt":sendData.survey,
      "age":sendData.age,
      "questionsAreAnsrwered":true,
      "answersToQuestions":sendData.answer,
      "generateLifePlan":false,
      "lifePlanDataRequest":""
    };
    const apiUrl =
        "https://e5120pdd9j.execute-api.us-east-1.amazonaws.com/default/ynlAIControler";
    final headers = {'Content-Type': 'application/json'};
    final response = await http.post(Uri.parse(apiUrl),
        headers: headers, body: jsonEncode(data));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      String dataResponse = data['response'];
      setState(() {
        RegExp regex = RegExp(r'\d+\.\s+(.+)');
        Iterable<Match> matches = regex.allMatches(dataResponse);
        
        for (Match match in matches) {
          answerResponse.add(match.group(1)!.trim());
        }

        setState(() {
          isLoading = false;
        });
      });
      safePrint('Received. $answerResponse');
    } else {
      safePrint('error occured. ${response.body}');
    }
  }

  @override
  Widget build(BuildContext context) {
    if(isLoading) {
      return (Container());
    } 
    else {
      return Consumer(builder: (context, ref, child)
    {
      final themeMode = sendData.theme;
      Color backgroundColor = themeMode == 0 ? lightTheme
          .scaffoldBackgroundColor : darkTheme.scaffoldBackgroundColor;
      Color textColor = themeMode == 0 ? Colors.black : Colors.white;
      return WillPopScope(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
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
                  GestureDetector(
                    onTap: () {
                      sendData.current_job_title = answerResponse[0];
                      widget.onGoToPage(12);
                    },
                    child: Container(
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
                      child: Column(
                        children: <Widget>[
                          Stack(
                            children: [
                              Container(
                                padding: const EdgeInsets.only(top: 5),
                                alignment: Alignment.center,
                                child: Text(
                                  'Your top career',
                                  style: TextStyle(
                                    color: textColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              // Container(
                              //   alignment: Alignment.centerLeft,
                              //   child: buildNoBadge(1, true),
                              // )
                            ],
                          ),
                          const SizedBox(height: 20.0),
                          Container(
                            width: 310,
                            height: 54,
                            decoration: BoxDecoration(
                              color: const Color(0xFF237A6A),
                              shape: BoxShape.rectangle,
                              border: Border.all(
                                color: const Color(0xFF84C1B6),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            alignment: Alignment.center,
                            child:  Text(
                              answerResponse[0],
                              overflow: TextOverflow.ellipsis,
                              maxLines: 3,
                              style: TextStyle(
                                color: textColor,
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                        buildSubTitle(backgroundColor, textColor, 2,answerResponse[1]),
                        SizedBox(
                          width: MediaQuery
                              .of(context)
                              .size
                              .width * 0.07,
                        ),
                        buildSubTitle(backgroundColor, textColor, 3,answerResponse[2]),
                      ],
                  ),
                  const SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                        buildSubTitle(backgroundColor, textColor, 4,answerResponse[3]),
                        SizedBox(
                          width: MediaQuery
                              .of(context)
                              .size
                              .width * 0.07,
                        ),
                        buildSubTitle(backgroundColor, textColor, 5,answerResponse[4]),
                      ],
                  ),
                ],
              ),
              GestureDetector(
                onTap: () async {
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
                    'Find Another Path',
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

  Widget buildSubTitle(Color backgroundColor, Color textColor, int idx , String title)
  {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          sendData.current_job_title = title;
          widget.onGoToPage(12);
        },
        child: Container(
          padding: const EdgeInsets.all(10.0),
          height: 65,
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
          child: Container(
            alignment: Alignment.center,
            child: Text(
              '$idx. $title',
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: TextStyle(
                color: textColor,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      )
    );
  }

  Widget buildNoBadge(int idx, bool isActived) {
    return Container(
      width: 35,
      height: 35,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: isActived
            ? const Color(0xFFFFE146).withOpacity(0.4)
            : const Color(0xFFE5F0EE),
        shape: BoxShape.rectangle,
        border: Border.all(
          color: isActived ? const Color(0xFFFFE146) : Colors.transparent,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Text(
        '#$idx',
        style: TextStyle(
          color: isActived ? const Color(0xFFC2A407) : const Color(0xFF237A6A),
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
