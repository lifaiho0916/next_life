import 'package:flutter/material.dart';
import 'package:next_life/components.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:next_life/constants.dart';
import 'package:next_life/data/init_data.dart';

class PasswordPage extends StatefulWidget {
  const PasswordPage({
    required this.onGoToPage,
    super.key,
  });

  /// The action to go to target page when tap,
  final bool Function(int) onGoToPage;

  @override
  State<PasswordPage> createState() => _PasswordPageState();
}

class _PasswordPageState extends State<PasswordPage> {
  late final TextEditingController _currentPwdController;
  late final TextEditingController _newPwdController;
  late final TextEditingController _confirmPwdController;
  late bool cur,pwd1,pwd2;

  @override
  void initState() {
    super.initState();
    _currentPwdController = TextEditingController(text: '');
    _newPwdController = TextEditingController(text: '');
    _confirmPwdController = TextEditingController(text: '');
    cur = pwd1 = pwd2 = false;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      final themeMode = sendData.theme;
      Color backgroundColor = themeMode == 0
          ? lightTheme.scaffoldBackgroundColor
          : darkTheme.scaffoldBackgroundColor;
      Color textColor = themeMode == 0 ? Colors.black : Colors.white;
      return WillPopScope(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  width: double.maxFinite,
                  height: 420,
                  padding: const EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    color: backgroundColor,
                    shape: BoxShape.rectangle,
                    border: Border.all(color: const Color(0xFFBDDED8)),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Column(
                    children: <Widget>[
                      Text(
                        'Current password',
                        style: TextStyle(
                          color: textColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      SizedBox(
                        height: 42.0,
                        child: TextField(
                          controller: _currentPwdController,
                          style: const TextStyle(color: Color(0xFF46A291)),
                          decoration: InputDecoration(
                            fillColor: const Color(0xFFF1F7F6),
                            filled: true,
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 15),
                            border: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Color(0xFF237A6A)),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                    const BorderSide(color: Color(0xFF237A6A))),
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Color(0xFF237A6A)),
                                borderRadius: BorderRadius.circular(10)),
                            suffixIcon: MlIconButton(
                              size: 20,
                              tooltip: cur?'Hide':'Show',
                              onTap: () {
                                setState(() {cur = !cur;});
                              },
                              icon: cur?Icons.visibility:Icons.visibility_off,
                              enabledColor: const Color(0xFF237A6A),
                            ),
                          ),
                          onChanged: (value) {},
                          textAlign: TextAlign.start,
                          obscureText: !cur,
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
                      Text(
                        'New password',
                        style: TextStyle(
                          color: textColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      SizedBox(
                        height: 42.0,
                        child: TextField(
                          controller: _newPwdController,
                          style: const TextStyle(color: Color(0xFF46A291)),
                          decoration: InputDecoration(
                            fillColor: const Color(0xFFF1F7F6),
                            filled: true,
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 15),
                            border: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Color(0xFF237A6A)),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                    const BorderSide(color: Color(0xFF237A6A))),
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Color(0xFF237A6A)),
                                borderRadius: BorderRadius.circular(10)),
                            suffixIcon: MlIconButton(
                              size: 20,
                              tooltip: pwd1?'Hide':'Show',
                              onTap: () {
                                setState(() {pwd1=!pwd1;});
                              },
                              icon: pwd1?Icons.visibility:Icons.visibility_off,
                              enabledColor: const Color(0xFF237A6A),
                            ),
                          ),
                          onChanged: (value) {},
                          textAlign: TextAlign.start,
                          obscureText: !pwd1,
                        ),
                      ),
                      const SizedBox(height: 25.0),
                      Container(
                        margin: const EdgeInsets.only(bottom: 5.0),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Confirm new password',
                          style: TextStyle(
                            color: textColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 42.0,
                        child: TextField(
                          controller: _confirmPwdController,
                          style: const TextStyle(color: Color(0xFF46A291)),
                          decoration: InputDecoration(
                            fillColor: const Color(0xFFF1F7F6),
                            filled: true,
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 15),
                            border: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Color(0xFF237A6A)),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                    const BorderSide(color: Color(0xFF237A6A))),
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Color(0xFF237A6A)),
                                borderRadius: BorderRadius.circular(10)),
                            suffixIcon: MlIconButton(
                              size: 20,
                              tooltip: pwd2?'Hide':'Show',
                              onTap: () {
                                setState(() {pwd2=!pwd2;});
                              },
                              icon: pwd2?Icons.visibility:Icons.visibility_off,
                              enabledColor: const Color(0xFF237A6A),
                            ),
                          ),
                          onChanged: (value) {},
                          textAlign: TextAlign.start,
                          obscureText: !pwd2,
                        ),
                      ),
                      const SizedBox(height: 35.0),
                      GestureDetector(
                        onTap: () async {
                          if (_newPwdController.text ==
                              _confirmPwdController.text) {
                            changePassword(_currentPwdController.text,
                                _newPwdController.text);
                          }
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
        ),
        onWillPop: () async {
          return widget.onGoToPage(-1);
        },
      );
    });
  }
}
