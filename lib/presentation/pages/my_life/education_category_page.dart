import 'package:flutter/material.dart';
import 'package:next_life/pages.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:next_life/data/init_data.dart';
import 'package:next_life/constants.dart';
class EducationCategoryPage extends StatefulWidget {
  const EducationCategoryPage({
    super.key,
  });

  @override
  State<EducationCategoryPage> createState() => _EducationCategoryPageState();
}

class _EducationCategoryPageState extends State<EducationCategoryPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child)
    {
      final themeMode = sendData.theme;
      Color backgroundColor = themeMode == 0 ? lightTheme
          .scaffoldBackgroundColor : darkTheme.scaffoldBackgroundColor;
      Color textColor = themeMode == 0 ? Colors.black : Colors.white;
      return SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          height: 435,
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Education',
                style: TextStyle(
                  color: textColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Column(
                children: <Widget>[
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Highest level achieved',
                      style: TextStyle(
                        color: textColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const SizedBox(height: 5.0),
                  GestureDetector(
                    onTap: () async {
                      if (context.mounted) {
                        await showDialog(
                          context: context,
                          builder: (context) =>
                          const HighestLevelAchievedDialogPage(),
                        );
                      }
                    },
                    child: Container(
                      width: double.maxFinite,
                      height: 42,
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF1F7F6),
                        shape: BoxShape.rectangle,
                        border: Border.all(color: const Color(0xFF7EBEB2)),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      alignment: Alignment.centerLeft,
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'Select level',
                            style: TextStyle(
                              color: Color(0xFF237A6A),
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Icon(
                            Icons.chevron_right_outlined,
                            color: Color(0xFF237A6A),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Degree earned',
                      style: TextStyle(
                        color: textColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const SizedBox(height: 5.0),
                  GestureDetector(
                    onTap: () async {
                      if (context.mounted) {
                        await showDialog(
                          context: context,
                          builder: (context) => const DegreeEarnedDialogPage(),
                        );
                      }
                    },
                    child: Container(
                      width: double.maxFinite,
                      height: 42,
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF1F7F6),
                        shape: BoxShape.rectangle,
                        border: Border.all(color: const Color(0xFF7EBEB2)),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      alignment: Alignment.centerLeft,
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'Select degree',
                            style: TextStyle(
                              color: Color(0xFF237A6A),
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Icon(
                            Icons.chevron_right_outlined,
                            color: Color(0xFF237A6A),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Date of graduation',
                      style: TextStyle(
                        color: textColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const SizedBox(height: 5.0),
                  GestureDetector(
                    onTap: () async {
                      if (context.mounted) {
                        await showDialog(
                          context: context,
                          builder: (
                              context) => const GraduationDateDialogPage(),
                        );
                      }
                    },
                    child: Container(
                      width: double.maxFinite,
                      height: 42,
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF1F7F6),
                        shape: BoxShape.rectangle,
                        border: Border.all(color: const Color(0xFF7EBEB2)),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      alignment: Alignment.centerLeft,
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'Select date',
                            style: TextStyle(
                              color: Color(0xFF237A6A),
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Icon(
                            Icons.chevron_right_outlined,
                            color: Color(0xFF237A6A),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Certification',
                      style: TextStyle(
                        color: textColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const SizedBox(height: 5.0),
                  GestureDetector(
                    onTap: () async {
                      if (context.mounted) {
                        await showDialog(
                          context: context,
                          builder: (context) => const CertificationDialogPage(),
                        );
                      }
                    },
                    child: Container(
                      width: double.maxFinite,
                      height: 42,
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF1F7F6),
                        shape: BoxShape.rectangle,
                        border: Border.all(color: const Color(0xFF7EBEB2)),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      alignment: Alignment.centerLeft,
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'Select certification',
                            style: TextStyle(
                              color: Color(0xFF237A6A),
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Icon(
                            Icons.chevron_right_outlined,
                            color: Color(0xFF237A6A),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
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
      );
    });
  }
}
