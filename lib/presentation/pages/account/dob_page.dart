// ignore_for_file: no_leading_underscores_for_local_identifiers, depend_on_referenced_packages, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:next_life/main.dart';
import 'package:next_life/constants.dart';
import 'package:next_life/data/init_data.dart';
import 'package:next_life/transfer.dart';
import 'package:intl/intl.dart';
import 'package:textfield_datepicker/textfield_datepicker.dart';

class DobPage extends StatefulWidget {
  const DobPage({
    required this.onGoToPage,
    super.key,
  });

  /// The action to go to target page when tap,
  final bool Function(int) onGoToPage;

  @override
  State<DobPage> createState() => _DobPageState();
}

class _DobPageState extends State<DobPage> {
  final TextEditingController _birthDateController = TextEditingController();
  late String current_dob;

  @override
  void initState() {
    super.initState();
    current_dob = sendData.day_of_birth;
    _birthDateController.text = current_dob;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      final themeMode = ref.watch(themeModeProvider);
      Color backgroundColor = themeMode == 0
          ? lightTheme.scaffoldBackgroundColor
          : darkTheme.scaffoldBackgroundColor;
      current_dob = sendData.day_of_birth;
      return WillPopScope(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: <Widget>[
                Container(
                  width: double.maxFinite,
                  height: 342,
                  padding: const EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    color: backgroundColor,
                    shape: BoxShape.rectangle,
                    border: Border.all(color: const Color(0xFFBDDED8)),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Column(
                    children: <Widget>[
                      const Text(
                        'Current date of birth',
                        style: TextStyle(
                          color: Color(0xFF414C57),
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      Container(
                        height: 41,
                        decoration: BoxDecoration(
                          color: const Color(0xFFF1F7F6),
                          shape: BoxShape.rectangle,
                          border: null,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          current_dob,
                          style: const TextStyle(color: Color(0xFF46A291)),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      Container(
                        height: 1,
                        decoration: const BoxDecoration(
                          color: Color(0xFFBDDED8),
                          shape: BoxShape.rectangle,
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      const Text(
                        'New date of birth',
                        style: TextStyle(
                          color: Color(0xFF414C57),
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      SizedBox(
                          height: 65,
                          child: TextfieldDatePicker(
                              textfieldDatePickerPadding: EdgeInsets.zero,
                              style: const TextStyle(color: Colors.black),
                              decoration: const InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: 10,
                                  ),
                                  suffixIcon: Padding(
                                    padding: EdgeInsets.all(4),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      borderSide: BorderSide(
                                        color: Color(0xffE9F4EE),
                                        width: 1,
                                      )),
                                  disabledBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      borderSide: BorderSide(
                                        color: Color(0xffE9F4EE),
                                        width: 1,
                                      )),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      borderSide: BorderSide(
                                        color: Color(0xffE9F4EE),
                                        width: 1,
                                      ))),
                              textfieldDatePickerController:
                                  _birthDateController,
                              materialDatePickerFirstDate: DateTime(1900),
                              materialDatePickerLastDate: DateTime(2200),
                              materialDatePickerInitialDate: DateTime.now(),
                              preferredDateFormat: DateFormat('yyyy-MM-dd'),
                              cupertinoDatePickerMaximumDate: DateTime(2200),
                              cupertinoDatePickerMinimumDate: DateTime(1900),
                              cupertinoDatePickerBackgroundColor: Colors.white,
                              cupertinoDatePickerMaximumYear: 2200,
                              cupertinoDateInitialDateTime: DateTime.now())),
                      const SizedBox(height: 25.0),
                      GestureDetector(
                        onTap: () async {
                          sendData.day_of_birth = _birthDateController.text;
                          sendUserInfoToAWS();
                          widget.onGoToPage(2);
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
              ],
            ),
          ),
          onWillPop: () async {
            return widget.onGoToPage(-1);
          });
    });
  }
}
