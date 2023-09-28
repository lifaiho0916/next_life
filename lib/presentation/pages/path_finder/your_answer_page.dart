// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:next_life/data/init_data.dart';

import 'package:next_life/constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:amplify_flutter/amplify_flutter.dart';
import 'dart:convert';

class YourAnswerPage extends StatefulWidget {
  const YourAnswerPage({
    required this.onGoToPage,
    super.key,
  });

  /// The action to go to target page when tap,
  final bool Function(int) onGoToPage;

  @override
  State<YourAnswerPage> createState() => _YourAnswerPageState();
}

class _YourAnswerPageState extends State<YourAnswerPage>
    with SingleTickerProviderStateMixin {
  final PageController _answersController = PageController();
  late AnimationController _animationController;
  List<bool> work = List<bool>.filled(8,true);
  List<String> questionListResponse = [];
  String currentQuestion = '', option1 = '', option2 = '';
  List<String> answer= List<String>.filled(8, '');
  int curQuestionIndex = 0;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getQuestionFromAWS();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _answersController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  Future<void> getQuestionFromAWS() async {
    setState(() {
      isLoading = true; // Show loading spinner
    });
    var data = {
      "prompt":sendData.survey,
      "age":sendData.age,
      "questionsAreAnsrwered":false,
      "answersToQuestions":"",
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
      setState(() {
        isLoading = false;
        questionListResponse = data['response'].split(RegExp(r'\d+\.'));
        questionListResponse.removeWhere((part) => part.trim().isEmpty);

        curQuestionIndex = 0;
        currentQuestion = questionListResponse[1].trim().split(RegExp(r'a\)|b\)'))[0];
        option1 = questionListResponse[1].trim().split(RegExp(r'a\)|b\)'))[1];
        option2 = questionListResponse[1].trim().split(RegExp(r'a\)|b\)'))[2];
      });
    } else {
      safePrint('error occured. ${response.body}');
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
      return WillPopScope(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 20.0),
                if (isLoading) buildLoadingWidget(),
                if (!isLoading) Column(
                  children: [
                    const SizedBox(height: 20.0,),
                    SizedBox(
                      child: Text(
                        "Answer the follow questions honestly",
                        style: GoogleFonts.jotiOne(
                          fontSize: 30,
                          color: const Color.fromRGBO(41, 137, 119, 1),
                          letterSpacing: 4,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 50.0),
                    Text(
                      'What is your answer to...?',
                      style: TextStyle(
                        color: textColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 15.0),
                    Container(
                      margin: const EdgeInsets.fromLTRB(40, 10, 40, 10),
                      child:Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: indicators(7, curQuestionIndex),
                      ),
                    ),
                    const SizedBox(height: 50.0),
                    SizedBox(
                      // width: double.maxFinite,
                      height: 350.0,
                      child: PageView(
                        padEnds: true,
                        pageSnapping: false, //change it to false
                        controller: _answersController,
                        children: [
                          buildAnswerCard(),
                        ],
                      ),
                    ),
                    const SizedBox(height: 1.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            prevPage();
                          },
                          child: Image.asset('assets/meta/pre_answer.png'),
                        ),
                        GestureDetector(
                          onTap: () {
                            nextPage();
                          },
                          child: Image.asset('assets/meta/next_answer.png'),
                        ),
                      ],
                    )
                  ],
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
 Widget buildAnswerCard() {
  return Consumer(
    builder: (context, ref, child) {
      final themeMode = sendData.theme;
      Color backgroundColor =
          themeMode == 0 ? lightTheme.scaffoldBackgroundColor : darkTheme.scaffoldBackgroundColor;
      Color textColor = themeMode == 0 ? Colors.black : Colors.white;
      return Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 25),
            child: Text(
              currentQuestion,
              style: TextStyle(
                color: textColor,
              ),
            ),
          ),
          const SizedBox(height: 45.0),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 35),
            padding: const EdgeInsets.all(10.0),
            alignment: Alignment.topLeft,
            decoration: BoxDecoration(
              color: backgroundColor,
              shape: BoxShape.rectangle,
              border: Border.all(
                color: const Color(0xFF84C1B6),
                width: 1,
              ),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                buildOptionRadioButton(true, option1, textColor),
                const SizedBox(height: 15.0),
                buildOptionRadioButton(false, option2, textColor),
              ],
            ),
          ),
        ],
      );
    },
  );
}

Widget buildOptionRadioButton(bool value, String optionText, Color textColor) {
  return Row(
    children: [
      Radio(
        value: value,
        fillColor: MaterialStateProperty.all(
          const Color.fromRGBO(35, 122, 106, 1),
        ),
        groupValue: work[curQuestionIndex],
        onChanged: (newValue) {
          setState(() {
            work[curQuestionIndex] = newValue as bool;
          });
        },
      ),
      Expanded(
        child: GestureDetector(
          onTap: () {
            setState(() {
              work[curQuestionIndex] = value; // Toggle the radio value when the text is tapped
            });
          },
          child: Text(
            optionText,
            overflow: TextOverflow.ellipsis,
            maxLines: 3,
            style: TextStyle(
              color : textColor
            ),
          ),
        ),
      ),
    ],
  );
}

  List<Widget> indicators(answerLength, currentIndex) {
    return List<Widget>.generate(
      answerLength,
          (index) {
        return Container(
          margin: const EdgeInsets.all(1),
          width: 14,
          height: 4,
          decoration: BoxDecoration(
            color: currentIndex == index
                ? const Color(0xFF237A6A)
                : const Color(0xFF7EBEB2),
            shape: BoxShape.rectangle,
          ),
        );
      },
    );
  }

  void prevPage() {
    if(curQuestionIndex==0) return;
    setState(() {
      answer[curQuestionIndex] = work[curQuestionIndex]?'${curQuestionIndex+1}.A':'${curQuestionIndex+1}.B';
      curQuestionIndex--;
      currentQuestion = questionListResponse[curQuestionIndex+1].trim().split(RegExp(r'a\)|b\)'))[0];
      option1 = questionListResponse[curQuestionIndex+1].trim().split(RegExp(r'a\)|b\)'))[1];
      option2 = questionListResponse[curQuestionIndex+1].trim().split(RegExp(r'a\)|b\)'))[2];
      safePrint('Prev Page : $currentQuestion');
    });
    _answersController.animateToPage(curQuestionIndex,duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,);
  }

  void nextPage() {
    if(curQuestionIndex==6) {
      answer[curQuestionIndex] = work[curQuestionIndex]?'${curQuestionIndex+1}.A':'${curQuestionIndex+1}.B';
      sendData.answer = answer;
      widget.onGoToPage(11);
    }
    else {
      setState(() {
        answer[curQuestionIndex] = work[curQuestionIndex]?'${curQuestionIndex+1}.A':'${curQuestionIndex+1}.B';
        curQuestionIndex++;
        currentQuestion = questionListResponse[curQuestionIndex+1].trim().split(RegExp(r'a\)|b\)'))[0];
        option1 = questionListResponse[curQuestionIndex+1].trim().split(RegExp(r'a\)|b\)'))[1];
        option2 = questionListResponse[curQuestionIndex+1].trim().split(RegExp(r'a\)|b\)'))[2];
      });
      _answersController.animateToPage(curQuestionIndex,duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,);
    }
  }
}
