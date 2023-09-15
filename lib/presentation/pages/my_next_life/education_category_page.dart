import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:next_life/main.dart';
import 'package:next_life/constants.dart';

class EducationCategoryNextLifePage extends StatefulWidget {
  const EducationCategoryNextLifePage({
    super.key,
  });

  @override
  State<EducationCategoryNextLifePage> createState() => _EducationCategoryNextLifePageState();
}

class _EducationCategoryNextLifePageState extends State<EducationCategoryNextLifePage> {
  @override
  void initState() {
    super.initState();
  }

  bool education = true;
  bool checkedCollege = true;
  bool checkedEducation = false;

  @override
  Widget build(BuildContext context) {
    bool _checkbox = false;
    bool _checkboxListTile = false;
    return Consumer(builder: (context, ref, child)
    {
      final themeMode = ref.watch(themeModeProvider);
      Color backgroundColor = themeMode == 0 ? lightTheme
          .scaffoldBackgroundColor : darkTheme.scaffoldBackgroundColor;
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Do you want to pursue hinder education?',
                style: TextStyle(
                  color: Color(0xFF414C57),
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 15.0,),
              Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Radio(
                        fillColor: MaterialStateProperty.all(
                          const Color.fromRGBO(35, 122, 106, 1),
                        ),
                        value: true,
                        groupValue: education,
                        onChanged: (value) {
                          setState(() {
                            education = value as bool;
                          });
                        },
                      ),
                      const Text("Yes"),
                      const SizedBox(width: 65,),
                      Radio(
                        value: false,
                        fillColor: MaterialStateProperty.all(
                          const Color.fromRGBO(35, 122, 106, 1),
                        ),
                        groupValue: education,
                        onChanged: (value) {
                          setState(() {
                            education = value as bool;
                          });
                        },
                      ),
                      const Text("No"),
                    ],
                  ),
                  const SizedBox(height: 2.0)
                ],
              ),
              const SizedBox(height: 15.0,),
              Container(
                height: 1,  // Adjust the height to your preference
                color:const Color(0xFF949494),
              ),
              const SizedBox(height: 15.0,),
              Column(
                children: <Widget>[
                  Container(
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      'What type of education?',
                      style: TextStyle(
                        color: Color(0xFF414C57),
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const SizedBox(height: 5.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Checkbox(
                        value: _checkbox,
                        onChanged: (value) {
                          setState(() {
                            _checkbox = !_checkbox;
                          });
                        },
                      ),
                      const Text("Yes"),
                      const SizedBox(width: 65,),
                      Checkbox(
                        value: _checkbox,
                        onChanged: (value) {
                          setState(() {
                            _checkbox = !_checkbox;
                          });
                        },
                      ),
                      const Text("No"),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 15.0,),
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
