// ignore_for_file: non_constant_identifier_names

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:next_life/components.dart';
import 'package:next_life/pages.dart';

import 'package:next_life/constants.dart';
import 'package:next_life/data/init_data.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({
    required this.onGoToPage,
    super.key,
  });

  /// The action to go to target page when tap,
  final bool Function(int) onGoToPage;

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  late final TextEditingController _passwordController;
  late String current_userName, current_dob, current_gender;

  @override
  void initState() {
    super.initState();

    _passwordController = TextEditingController(text: 'Password');
    current_userName = sendData.userName;
    current_dob='';
    current_dob = sendData.day_of_birth;
    current_gender = sendData.gender;
  }

  @override
  Widget build(BuildContext context) {
    current_userName = sendData.userName;
    current_dob = sendData.day_of_birth;
    current_gender = sendData.gender;
    return Consumer(builder: (context, ref, child) {
      final themeMode = sendData.theme;
      Color backgroundColor = themeMode == 0
          ? lightTheme.scaffoldBackgroundColor
          : darkTheme.scaffoldBackgroundColor;
      Color textColor = themeMode == 0 ? Colors.black : Colors.white;
      return WillPopScope(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                width: double.maxFinite,
                height: 370,
                padding: const EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  color: backgroundColor,
                  shape: BoxShape.rectangle,
                  border: Border.all(color: const Color(0xFFBDDED8)),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        sendData.curAvatarImage == ""? CircleAvatar(
                            backgroundColor: backgroundColor,
                            radius: 45,
                            backgroundImage: const AssetImage('assets/meta/avatar.jpg')
                        ):
                        CircleAvatar(
                          backgroundColor: backgroundColor,
                          radius: 45,
                          backgroundImage: FileImage(File(sendData.curAvatarImage)),
                        ),
                        Container(
                          width: 90,
                          height: 90,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.black.withOpacity(0.4),
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.add_photo_alternate_outlined,
                              color: Colors.white),
                          iconSize: 30,
                          onPressed: () async {
                            if (context.mounted) {
                              await showDialog(
                                context: context,
                                builder: (context) => const AvatarDialogPage(),
                              );
                            }
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 22.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Username',
                                style: TextStyle(
                                  color: textColor,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                ),
                              ),
                              const SizedBox(height: 3.0),
                              GestureDetector(
                                onTap: () async {
                                  widget.onGoToPage(4);
                                },
                                child: Container(
                                  height: 42,
                                  padding: const EdgeInsets.only(left: 10.0),
                                  alignment: Alignment.centerLeft,
                                  decoration: BoxDecoration(
                                    color: backgroundColor,
                                    shape: BoxShape.rectangle,
                                    border: Border.all(
                                        color: const Color(0xFF237A6A)),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  child: Text(
                                    current_userName,
                                    style: const TextStyle(
                                      color: Color(0xFF46A291),
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.08,
                        ),
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Date of birth',
                                style: TextStyle(
                                  color: textColor,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                ),
                              ),
                              const SizedBox(height: 3.0),
                              GestureDetector(
                                onTap: () async {
                                  widget.onGoToPage(3);
                                },
                                child: Container(
                                  height: 42,
                                  padding: const EdgeInsets.only(left: 10.0),
                                  alignment: Alignment.centerLeft,
                                  decoration: BoxDecoration(
                                    color: backgroundColor,
                                    shape: BoxShape.rectangle,
                                    border: Border.all(
                                        color: const Color(0xFF237A6A)),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  child: Text(
                                    current_dob,
                                    style: const TextStyle(
                                      color: Color(0xFF46A291),
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 22.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Gender',
                                style: TextStyle(
                                  color: textColor,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                ),
                              ),
                              const SizedBox(height: 3.0),
                              GestureDetector(
                                onTap: () async {
                                  widget.onGoToPage(5);
                                },
                                child: Container(
                                  height: 42,
                                  padding: const EdgeInsets.only(left: 10.0),
                                  alignment: Alignment.centerLeft,
                                  decoration: BoxDecoration(
                                    color: backgroundColor,
                                    shape: BoxShape.rectangle,
                                    border: Border.all(
                                        color: const Color(0xFF237A6A)),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  child: Text(
                                    current_gender,
                                    style: const TextStyle(
                                      color: Color(0xFF46A291),
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.08,
                        ),
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Password',
                                style: TextStyle(
                                  color: textColor,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                ),
                              ),
                              const SizedBox(height: 3.0),
                              SizedBox(
                                height: 42,
                                child: TextField(
                                  controller: _passwordController,
                                  style:
                                      const TextStyle(color: Color(0xFF46A291)),
                                  decoration: InputDecoration(
                                    fillColor: backgroundColor,
                                    filled: true,
                                    contentPadding: const EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 10),
                                    border: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Color(0xFF237A6A)),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: const BorderSide(
                                            color: Color(0xFF237A6A))),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Color(0xFF237A6A)),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    suffixIcon: MlIconButton(
                                      size: 20,
                                      tooltip: 'Show',
                                      onTap: () {
                                        setState(() {});
                                      },
                                      icon: Icons.visibility,
                                      enabledColor: const Color(0xFF46A291),
                                    ),
                                  ),
                                  onChanged: (value) {},
                                  obscureText: true,
                                  readOnly: true,
                                  textAlign: TextAlign.start,
                                  onTap: () {
                                    widget.onGoToPage(6);
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 22.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Expanded(
                          child: GestureDetector(
                            onTap: () async {
                              widget.onGoToPage(0);
                            },
                            child: Container(
                              margin: const EdgeInsets.only(top: 5.0),
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
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.notifications,
                                    color: Colors.white,
                                  ),
                                  SizedBox(width: 10.0),
                                  Text(
                                    'Notification',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 14),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.08,
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () async {
                              widget.onGoToPage(7);
                            },
                            child: Container(
                              margin: const EdgeInsets.only(top: 5.0),
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
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.color_lens,
                                    color: Colors.white,
                                  ),
                                  SizedBox(width: 10.0),
                                  Text(
                                    'Appearance',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 14),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () async {
                  widget.onGoToPage(0);
                },
                child: Container(
                  height: 42,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: const Color(0xFF237A6A),
                    shape: BoxShape.rectangle,
                    border: null,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: const Text(
                    'Save profile',
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
        onWillPop: () async {
          return widget.onGoToPage(-1);
        },
      );
    });
  }
}
