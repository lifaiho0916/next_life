import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:next_life/data/init_data.dart';
import 'package:next_life/constants.dart';

class WeeklySchedulePage extends StatefulWidget {
  const WeeklySchedulePage({Key? key}) : super(key: key);

  @override
  State<WeeklySchedulePage> createState() => _WeeklySchedulePageState();
}

class _WeeklySchedulePageState extends State<WeeklySchedulePage> {
  List<WorkSchedule> schedules=[];
  int selectedWeekday = 0;

  final List<String> weekdays = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday',
  ];
  @override
  Widget build(BuildContext context) {
    getWeeklySchedule();
    return buildWeeklySchedule();
  }

  void getWeeklySchedule() {
    if(sendData.schedule == '') return;
    String dailyScheduleWeekday = extractDailySchedule(sendData.schedule);
    safePrint(dailyScheduleWeekday);
    schedules = extractWorkSchedules(dailyScheduleWeekday);
  }

  List<String> getTaskSchedule(String scheduleText) {
    final lines = scheduleText.split(';');
    return lines.where((line) => line.trim().isNotEmpty).toList();
  }

  List<WorkSchedule> extractWorkSchedules(String text) {
    List<String> task = getTaskSchedule(text);
    return task.map((match) {
      int colonIndex = match.indexOf(':');
      final time = match.substring(0,colonIndex);
      final workContent = match.substring(colonIndex+1);
      return WorkSchedule(time, workContent);
    }).toList();
  }

  String extractDailySchedule(String source) {
    var pattern = "${weekdays[selectedWeekday]}: (.*?)\\.";
    if(selectedWeekday == 0) pattern = 'Monday:(.*?)(?=(?:Tuesday:|Wednesday:|Thursday:|Friday:|Saturday:|Sunday:|\$))';
    final regExp = RegExp(pattern, multiLine: true);
    final match = regExp.firstMatch(source);

    return match?.group(1) ?? '';
  }

  Widget buildWeeklySchedule() {
    return Consumer(builder: (context, ref, child) {
      final themeMode = sendData.theme;
      Color backgroundColor =
          themeMode == 0 ? lightTheme.scaffoldBackgroundColor : darkTheme.scaffoldBackgroundColor;
      Color textColor = themeMode == 0 ? Colors.black : Colors.white;
    
      return SingleChildScrollView(child: Container(
        width: MediaQuery.of(context).size.width * 0.53,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        decoration: BoxDecoration(
          color: backgroundColor,
          shape: BoxShape.rectangle,
          border: Border.all(color: const Color(0xFFBDDED8)),
          borderRadius: BorderRadius.circular(20.0),
        ),
        alignment: Alignment.center,
        child: Column(
          children: [
          Container(
            alignment: Alignment.centerRight,
            margin: const EdgeInsets.all(10.0),
            
            // decoration: BoxDecoration(
            //   color: backgroundColor,
            //   shape: BoxShape.rectangle,
            //   border: Border.all(
            //     color: const Color(0xFF7EBEB2),
            //     width: 1,
            //   ),
            //   borderRadius: BorderRadius.circular(20.0),
            // ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(
                  icon: const Icon(Icons.arrow_left, color: Color(0xFF237A6A)),
                  onPressed:() => {
                    setState(() {
                      if(selectedWeekday>0) selectedWeekday--;
                    })
                  },
                ),
                Text(
                  weekdays[selectedWeekday],
                  style: TextStyle(
                    backgroundColor: backgroundColor,
                    color: const Color(0xFF237A6A),
                  ),
                ),

                // child: DropdownButton<String>(
                //   value: weekdays[selectedWeekday],
                //   style: TextStyle(
                //         backgroundColor: backgroundColor,
                //         color: backgroundColor
                //       ),
                //   items: weekdays.map((String value) {
                //     return DropdownMenuItem<String>(
                //       value: value,
                //       child: Text(
                //         value,
                //         style: TextStyle(
                //           backgroundColor: backgroundColor,
                //           color: const Color(0xFF237A6A),
                //         ),
                //       ),
                //     );
                //   }).toList(),
                //   onChanged: (String? newValue) {
                //     setState(() {
                //       selectedWeekday = weekdays.indexOf(newValue!);
                //     });
                //   },
                // ),

                IconButton(
                  icon: const Icon(Icons.arrow_right, color: Color(0xFF237A6A),),
                  onPressed: () => {
                    setState(() {
                      if(selectedWeekday<6) selectedWeekday++;
                    })
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
          schedules.isNotEmpty
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: List<Widget>.from(
                    schedules.map((schedule) {
                      return buildWeeklyScheduleContent(
                        schedule.time,
                        schedule.workContent,
                      );
                    }),
                  ),
                )
              : Center(
                  child: Text(
                    'No Plan',
                    style: TextStyle(
                      color: textColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
            ]),
          ),
        );
      });
    }
  Widget buildWeeklyScheduleContent(
    String time,
    String scheduleTitle,
  ) {
    final themeMode = sendData.theme;
    Color backgroundColor =
        themeMode == 0 ? lightTheme.scaffoldBackgroundColor : darkTheme.scaffoldBackgroundColor;
    return Column(
            children: <Widget>[
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(bottom: 5),
                child: Text(
                  time,
                  style: const TextStyle(
                    color: Color(0xFF237A6A),
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    // height: diffTime.toDouble(),
                    width: 1,
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: backgroundColor,
                      shape: BoxShape.rectangle,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 80,
                      margin: const EdgeInsets.only(left: 20),
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: backgroundColor,
                        border: Border.all(color: const Color(0xFF237A6A)),
                        borderRadius: BorderRadius.circular(10.0),
                        shape: BoxShape.rectangle,
                      ),
                      child: SingleChildScrollView(
                        child: Text(
                          scheduleTitle,
                          style: const TextStyle(
                            color: Color(0xFF237A6A),
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          );
  }
}
