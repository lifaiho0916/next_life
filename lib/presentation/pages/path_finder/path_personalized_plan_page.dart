import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:next_life/data/init_data.dart';
import 'package:next_life/constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:next_life/transfer.dart';

class PathPersonalizedPlanPage extends StatefulWidget {
  const PathPersonalizedPlanPage({
    required this.onGoToPage,
    super.key,
  });

  /// The action to go to target page when tap,
  final bool Function(int) onGoToPage;

  @override
  State<PathPersonalizedPlanPage> createState() => _PathPersonalizedPlanPageState();
}

class _PathPersonalizedPlanPageState extends State<PathPersonalizedPlanPage> {
  bool isLoading = true;
  String schedule = '';
 

  @override
  void initState() {
    super.initState();
    loadScheduleData();
  }
  
  Future<void> loadScheduleData() async {
    setState(() {
      isLoading = true; // Show loading spinner
    });
    bool result = await getDataScheduleFromAWS();
    sendData.schedule.replaceAll(RegExp(r'[^\x00-\x7F]+'), '');
    if(result)
    {
      setState(() {
        schedule = sendData.schedule;
        sendUserScheduleToAWS();
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
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              if (isLoading) buildLoadingWidget(),
              if (!isLoading) Column(
               // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget> [
                  const SizedBox(height: 20.0),
                  SizedBox(
                    child: Text(
                      "Below is a personalized plan to get to your next life",
                      style: GoogleFonts.jotiOne(
                        fontSize: 25,
                        color: const Color.fromRGBO(41, 137, 119, 1),
                        //letterSpacing: 4,
                      ),
                     // textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 50.0),
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
                    child: Text(schedule,
                      style: TextStyle(color: textColor),
                    ),
                  ),
                  const SizedBox(height: 20.0,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                        flex: 3,
                        child: GestureDetector(
                          onTap: () async {
                            widget.onGoToPage(0);
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
                              'Save',
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
                            widget.onGoToPage(13);
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
                              'Next',
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
                  )
                ],

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
