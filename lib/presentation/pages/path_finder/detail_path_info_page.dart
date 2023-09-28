// ignore_for_file: depend_on_referenced_packages

import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:next_life/constants.dart';
import 'package:next_life/data/init_data.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DetailPathInfoPage extends StatefulWidget {
  const DetailPathInfoPage({
    required this.onGoToPage,
    super.key,
  });

  /// The action to go to target page when tap,
  final bool Function(int) onGoToPage;

  @override
  State<DetailPathInfoPage> createState() => _DetailPathInfoPageState();
}

class _DetailPathInfoPageState extends State<DetailPathInfoPage> {
  String careerExplain = '';
  @override
  void initState() {
    super.initState();
    getAnswerData();
  }

Future<void> getAnswerData() async {
    
    var data = {
      "prompt":sendData.survey,
      "age":sendData.age,
      "questionsAreAnsrwered":true,
      "answersToQuestions":sendData.answer,
      "generateLifePlan":false,
      "lifePlanDataRequest":"",
      "suggestedCarrer": sendData.current_job_title,
      "careerIntroduce": true
    };
    const apiUrl =
        "https://e5120pdd9j.execute-api.us-east-1.amazonaws.com/default/ynlAIControler";
    final headers = {'Content-Type': 'application/json'};
    final response = await http.post(Uri.parse(apiUrl),
        headers: headers, body: jsonEncode(data));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      setState(() {
        careerExplain = data['response'];
       
      });
    } else {
      safePrint('error occured. ${response.body}');
    }
  }
  @override
  Widget build(BuildContext context) {
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 50.0,),
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
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.only(top: 5),
                      alignment: Alignment.center,
                      child: Text(
                        'Selected path',
                        style: TextStyle(
                          color: textColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    InkWell(
                      onTap: () async {
                        widget.onGoToPage(14);
                      },
                      child: Container(
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
                        child: Text(
                          sendData.current_job_title,
                          style: TextStyle(
                            color: textColor,
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Info about path',
                        style: TextStyle(
                          color: textColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Text(
                      careerExplain,
                      style: TextStyle(
                        color: textColor,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    flex: 3,
                    child: GestureDetector(
                      onTap: () async {
                       // widget.onGoToPage(13);
                        widget.onGoToPage(14);
                      },
                      child: Container(
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
                          'Walk this path',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery
                        .of(context)
                        .size
                        .width * 0.05,
                  ),
                  Expanded(
                    flex: 4,
                    child: GestureDetector(
                      onTap: () async {
                        widget.onGoToPage(10);
                      },
                      child: Container(
                        height: 39,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: backgroundColor,
                          shape: BoxShape.rectangle,
                          border: Border.all(
                            color: const Color(0xFF84C1B6),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: const Text(
                          'Choose another path',
                          style: TextStyle(
                            color: Color(0xFF237A6A),
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10.0,)
            ],
          ),
        ),
        onWillPop: () async {
          return widget.onGoToPage(-1);
        },
      );
    });
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
