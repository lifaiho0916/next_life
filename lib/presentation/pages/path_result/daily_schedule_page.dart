
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:next_life/data/init_data.dart';
import 'package:next_life/constants.dart';


class DailySchedulePage extends StatefulWidget {
  const DailySchedulePage({Key? key}) : super(key: key);

  @override
  State<DailySchedulePage> createState() => _DailySchedulePageState();
}

class _DailySchedulePageState extends State<DailySchedulePage> {

  List<WorkSchedule> schedules=[];

  @override
  void initState() {
    super.initState();
    getDailySchedule();
  }

  @override
  Widget build(BuildContext context) {
    return  buildDailySchedule();
  }
  
  void getDailySchedule() {
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
    final now = DateTime.now();
    final dayOfWeek = now.weekday;
    final dayNames = [
      'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'
    ];

    var pattern = "${dayNames[dayOfWeek - 1]}: (.*?)\\.";
    if(dayOfWeek == 1) pattern = 'Monday:(.*?)(?=(?:Tuesday:|Wednesday:|Thursday:|Friday:|Saturday:|Sunday:|\$))';
    final regExp = RegExp(pattern, multiLine: true);
    final match = regExp.firstMatch(source);

    return match?.group(1) ?? '';
  }

  Widget buildDailySchedule() {
    return Consumer(builder: (context, ref, child)
    {
      final themeMode = sendData.theme;
      Color textColor = themeMode == 0 ? Colors.black : Colors.white;
      Color backgroundColor = themeMode == 0 ? lightTheme
          .scaffoldBackgroundColor : darkTheme.scaffoldBackgroundColor;
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
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Icon(
                    Icons.edit_note_outlined,
                    color: Color(0xFF237A6A),
                    size: 18,
                  ),
                  Text(
                    'Edit',
                    style: TextStyle(
                      color: Color(0xFF237A6A),
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            schedules.isNotEmpty
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: List<Widget>.from(
                      schedules.map((schedule) {
                        return buildTimeSchedule(
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

  Widget buildTimeSchedule(
    String time,
    String scheduleTitle,
  ) {
    final themeMode = sendData.theme;
    Color backgroundColor = themeMode == 0 ? lightTheme
        .scaffoldBackgroundColor : darkTheme.scaffoldBackgroundColor;
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
                    decoration: const BoxDecoration(
                      color: Color(0xFFE5F0EE),
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
