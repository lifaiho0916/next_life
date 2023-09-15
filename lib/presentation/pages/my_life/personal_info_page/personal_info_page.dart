import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:next_life/main.dart';
import 'package:next_life/constants.dart';
import 'package:next_life/presentation/pages/my_life/personal_info_page/add_account_dialog_page.dart';
import 'package:next_life/data/init_data.dart';


class PersonalInfoPage extends StatefulWidget {
  const PersonalInfoPage({Key? key}) : super(key: key);


  @override
  State<PersonalInfoPage> createState() => _PersonalInfoPageState();
}

class _PersonalInfoPageState extends State<PersonalInfoPage> {
  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      final themeMode = ref.watch(themeModeProvider);
      Color backgroundColor = themeMode == 0 ? lightTheme
          .scaffoldBackgroundColor : darkTheme.scaffoldBackgroundColor;
      return SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(20),
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
                children: <Widget>[
                   Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const Text(
                            'Username',
                            style:  TextStyle(
                              color: Color(0xFF414C57),
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 3.0),
                          Text(
                            sendData.userName,
                            style: const TextStyle(
                              color: Color(0xFF237A6A),
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          const Text(
                            'Age',
                            style: TextStyle(
                              color: Color(0xFF414C57),
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 3.0),
                          Text(
                            '${sendData.age} years',
                            // sendData.age,
                            style: const TextStyle(
                              color: Color(0xFF237A6A),
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 18.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const Text(
                            'E-mail',
                            style: TextStyle(
                              color: Color(0xFF414C57),
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 3.0),
                          Text(
                            sendData.email,
                            style: const TextStyle(
                              color: Color(0xFF237A6A),
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          const Text(
                            'Gender',
                            style: TextStyle(
                              color: Color(0xFF414C57),
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 3.0),
                          Text(
                            sendData.gender,
                            style: const TextStyle(
                              color: Color(0xFF237A6A),
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 18.0),
                  Container(
                    height: 1,
                    decoration: const BoxDecoration(
                      color: Color(0xFFBDDED8),
                      shape: BoxShape.rectangle,
                    ),
                  ),
                  const SizedBox(height: 18.0),
                  GestureDetector(
                    onTap: () async {
                      if (context.mounted) {
                        await showDialog(
                          context: context,
                          builder: (context) => const AddAccountDialogPage(),
                        );
                      }
                    },
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Twitter',
                          style: TextStyle(
                            color: Color(0xFF414C57),
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          'Add account',
                          style: TextStyle(
                            color: Color(0xFF237A6A),
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 18.0),
                  Container(
                    height: 1,
                    decoration: const BoxDecoration(
                      color: Color(0xFFBDDED8),
                      shape: BoxShape.rectangle,
                    ),
                  ),
                  const SizedBox(height: 18.0),
                  GestureDetector(
                    onTap: () async {
                      if (context.mounted) {
                        await showDialog(
                          context: context,
                          builder: (context) => const AddAccountDialogPage(),
                        );
                      }
                    },
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Facebook',
                          style: TextStyle(
                            color: Color(0xFF414C57),
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          'Add account',
                          style: TextStyle(
                            color: Color(0xFF237A6A),
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 18.0),
                  Container(
                    height: 1,
                    decoration: const BoxDecoration(
                      color: Color(0xFFBDDED8),
                      shape: BoxShape.rectangle,
                    ),
                  ),
                  const SizedBox(height: 18.0),
                  GestureDetector(
                    onTap: () async {
                      if (context.mounted) {
                        await showDialog(
                          context: context,
                          builder: (context) => const AddAccountDialogPage(),
                        );
                      }
                    },
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Instagram',
                          style: TextStyle(
                            color: Color(0xFF414C57),
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          'Add account',
                          style: TextStyle(
                            color: Color(0xFF237A6A),
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 18.0),
                  Container(
                    height: 1,
                    decoration: const BoxDecoration(
                      color: Color(0xFFBDDED8),
                      shape: BoxShape.rectangle,
                    ),
                  ),
                  const SizedBox(height: 18.0),
                  GestureDetector(
                    onTap: () async {
                      if (context.mounted) {
                        await showDialog(
                          context: context,
                          builder: (context) => const AddAccountDialogPage(),
                        );
                      }
                    },
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'TikTok',
                          style: TextStyle(
                            color: Color(0xFF414C57),
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          'Add account',
                          style: TextStyle(
                            color: Color(0xFF237A6A),
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 18.0),
                  Container(
                    height: 1,
                    decoration: const BoxDecoration(
                      color: Color(0xFFBDDED8),
                      shape: BoxShape.rectangle,
                    ),
                  ),
                  const SizedBox(height: 21.0),
                  GestureDetector(
                    onTap: () async {
                      // Navigator.pushNamed(context, "/livingSituation");
                    },
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
          ],
        ),
      );
    });
  }
}
