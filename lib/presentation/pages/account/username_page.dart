// ignore_for_file: use_build_context_synchronously, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:next_life/data/init_data.dart';
import 'package:next_life/transfer.dart';

class UsernamePage extends StatefulWidget {
  const UsernamePage({
    required this.onGoToPage,
    super.key,
  });

  /// The action to go to target page when tap,
  final bool Function(int) onGoToPage;

  @override
  State<UsernamePage> createState() => _UsernamePageState();
}

class _UsernamePageState extends State<UsernamePage> {
  late final TextEditingController _usernameController;
  late String currnet_userName;

  @override
  void initState() {
    super.initState();
    _usernameController = TextEditingController(text: sendData.userName);
    currnet_userName = sendData.userName;
  }

  @override
  Widget build(BuildContext context) {
    currnet_userName = sendData.userName;
    return Consumer(builder: (context, ref, child) {
      final themeMode = sendData.theme;
      Color textColor = themeMode == 0 ? Colors.black : Colors.white;
      return WillPopScope(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  width: double.maxFinite,
                  height: 347,
                  padding: const EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.rectangle,
                    border: Border.all(color: const Color(0xFFBDDED8)),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Column(
                    children: <Widget>[
                      Text(
                        'Current username',
                        style: TextStyle(
                          color: textColor,
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
                            currnet_userName,
                            style: TextStyle(
                              color: textColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          )),
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
                        'New username',
                        style: TextStyle(
                          color: textColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      TextField(
                        controller: _usernameController,
                        style: const TextStyle(color: Color(0xFF46A291)),
                        decoration: InputDecoration(
                          fillColor: const Color(0xFFF1F7F6),
                          // Set the color inside the TextField
                          filled: true,
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 15),
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
                        ),
                        onChanged: (value) {},
                        textAlign: TextAlign.start,
                      ),
                      const SizedBox(height: 20.0),
                      Container(
                        height: 1,
                        decoration: const BoxDecoration(
                          color: Color(0xFFBDDED8),
                          shape: BoxShape.rectangle,
                        ),
                      ),
                      const SizedBox(height: 25.0),
                      GestureDetector(
                        onTap: () async {
                          sendData.userName = _usernameController.text;
                          sendUserInfoToAWS();
                          Navigator.pushNamed(context, "/");
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
