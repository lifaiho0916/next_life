import 'package:flutter/material.dart';
import 'package:next_life/components.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:next_life/constants.dart';
import 'package:next_life/data/init_data.dart';
import 'package:next_life/transfer.dart';

class LivingSituationPage extends StatefulWidget {
  const LivingSituationPage({Key? key}) : super(key: key);

  @override
  State<LivingSituationPage> createState() => _LivingSituationPageState();
}

class _LivingSituationPageState extends State<LivingSituationPage> {
  int _activeSubPageIdx = 0;

  late final TextEditingController _housingController,
                                  _transportationController,
                                  _dependentsController,
                                  _addressController,
                                  _petsController,
                                  _internetSpeedController,
                                  _hobbiesController,
                                  _sleepScheduleController,
                                  _housingTypeController,
                                  _transportationTypeController,
                                  _zipCodeController,
                                  _cityCodeController,
                                  _stateCodeController;

  @override
  void initState() {
    super.initState();
    _housingController = TextEditingController(text: sendData.housing);
    _transportationController = TextEditingController(text: sendData.transportation);
    _dependentsController = TextEditingController(text: sendData.dependents);
    _addressController = TextEditingController(text: sendData.address);
    _petsController = TextEditingController(text: sendData.pets);
    _internetSpeedController = TextEditingController(text: sendData.internetSpeed);
    _hobbiesController = TextEditingController(text: sendData.hobbies);
    _sleepScheduleController = TextEditingController(text: sendData.sleepSchedule);
    _housingTypeController = TextEditingController(text: sendData.housingType);
    _transportationTypeController = TextEditingController(text: sendData.transportationType);
    _zipCodeController = TextEditingController(text: sendData.zipCode);
    _cityCodeController = TextEditingController(text: sendData.cityCode);
    _stateCodeController = TextEditingController(text: sendData.stateCode);
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> subPages = [
      buildLivingSituationList(),
      buildHousing(),
      buildTransportation(),
      buildDependents(),
      buildAddress(),
      buildPets(),
      buildInternetSpeed(),
      buildHobbies(),
      buildSleepSchedule(),
    ];

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          subPages[_activeSubPageIdx],
        ],
      ),
    );
  }

  Widget buildLivingSituationList() {
    return Consumer(builder: (context, ref, child)
    {
      final themeMode = sendData.theme;
      Color backgroundColor = themeMode == 0 ? lightTheme
          .scaffoldBackgroundColor : darkTheme.scaffoldBackgroundColor;
      Color textColor = themeMode == 0 ? Colors.black : Colors.white;
      return Container(
        padding: const EdgeInsets.all(20),
        height: 407,
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
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Housing',
                        style: TextStyle(
                          color: textColor,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 3.0),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _activeSubPageIdx = 1;
                          });
                        },
                        child: Text(
                          _housingController.text == '' ? 'None' : _housingController.text,
                          style: const TextStyle(
                            color: Color(0xFF237A6A),
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Transportation',
                        style: TextStyle(
                          color: textColor,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 3.0),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _activeSubPageIdx = 2;
                          });
                        },
                        child: Text(
                          _transportationController.text == ''? 'None' : _transportationController.text,
                          style: const TextStyle(
                            color: Color(0xFF237A6A),
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Dependents',
                        style: TextStyle(
                          color: textColor,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 3.0),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _activeSubPageIdx = 3;
                          });
                        },
                        child: Text(
                          _dependentsController.text == '' ? 'None' : _dependentsController.text,
                          style: const TextStyle(
                            color: Color(0xFF237A6A),
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Address',
                        style: TextStyle(
                          color: textColor,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 3.0),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _activeSubPageIdx = 4;
                          });
                        },
                        child: Text(
                          _addressController.text == '' ? 'None' : _addressController.text,
                          style: const TextStyle(
                            color: Color(0xFF237A6A),
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Pets',
                        style: TextStyle(
                          color: textColor,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 3.0),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _activeSubPageIdx = 5;
                          });
                        },
                        child: Text(
                          _petsController.text == ''? 'None' : _petsController.text,
                          style: const TextStyle(
                            color: Color(0xFF237A6A),
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Internet speed',
                        style: TextStyle(
                          color: textColor,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 3.0),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _activeSubPageIdx = 6;
                          });
                        },
                        child: Text(
                          _internetSpeedController.text == '' ? 'None' : _internetSpeedController.text,
                          style: const TextStyle(
                            color: Color(0xFF237A6A),
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Hobbies',
                        style: TextStyle(
                          color: textColor,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 3.0),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _activeSubPageIdx = 7;
                          });
                        },
                        child: Text(
                          _hobbiesController.text == ''? 'None': _hobbiesController.text,
                          style: const TextStyle(
                            color: Color(0xFF237A6A),
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Sleep schedule',
                        style: TextStyle(
                          color: textColor,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 3.0),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _activeSubPageIdx = 8;
                          });
                        },
                        child: Text(
                          _sleepScheduleController.text == '' ? 'None' : _sleepScheduleController.text,
                          style: const TextStyle(
                            color: Color(0xFF237A6A),
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20.0),
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
                await sendUserProfileInfoToAWS();
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
                child: Text(
                  'Save',
                  style: TextStyle(
                    color: textColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }

  Widget buildHousing() {
    return Consumer(builder: (context, ref, child)
    {
      final themeMode = sendData.theme;
      Color backgroundColor = themeMode == 0 ? lightTheme
          .scaffoldBackgroundColor : darkTheme.scaffoldBackgroundColor;
      Color textColor = themeMode == 0 ? Colors.black : Colors.white;
      return Container(
        padding: const EdgeInsets.all(20),
        height: 287,
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
            Text(
              'Housing',
              style: TextStyle(
                color: textColor,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'housing',
                        style: TextStyle(
                          color: textColor,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 5.0),
                      SizedBox(
                        width: 125,
                        height: 42,
                        child: TextField(
                          controller: _housingController,
                          style: const TextStyle(color: Color(0xFF46A291)),
                          decoration: InputDecoration(
                            fillColor: const Color(
                                0xFFF1F7F6),
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
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Type of housing',
                        style: TextStyle(
                          color: textColor,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 5.0),
                      SizedBox(
                        width: 125,
                        height: 42,
                        child: TextField(
                          controller: _housingTypeController,
                          style: const TextStyle(color: Color(0xFF46A291)),
                          decoration: InputDecoration(
                            fillColor: const Color(0xFFF1F7F6),
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
                      ),
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.bottomRight,
                  padding: const EdgeInsets.only(top: 20),
                  child: MlIconButton(
                    size: 25,
                    tooltip: 'Delete',
                    padding: EdgeInsets.zero,
                    onTap: () {
                      setState(() {});
                    },
                    icon: Icons.delete_outline,
                    enabledColor: const Color(0xFFF75757),
                  ),
                )
              ],
            ),
            const SizedBox(height: 20.0),
            Container(
              height: 1,
              decoration: const BoxDecoration(
                color: Color(0xFF7EBEB2),
                shape: BoxShape.rectangle,
              ),
            ),
            const SizedBox(height: 20.0),
            GestureDetector(
              child: const Text(
                'Add extra housing infomation',
                style: TextStyle(
                  color: Color(0xFF237A6A),
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            Container(
              height: 1,
              decoration: const BoxDecoration(
                color: Color(0xFF7EBEB2),
                shape: BoxShape.rectangle,
              ),
            ),
            const SizedBox(height: 20.0),
            GestureDetector(
              onTap: () async {
                setState(() {
                  _activeSubPageIdx = 0;
                });
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
                child: Text(
                  'Save',
                  style: TextStyle(
                    color: textColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }

  Widget buildTransportation() {
    return Consumer(builder: (context, ref, child)
    {
      final themeMode = sendData.theme;
      Color backgroundColor = themeMode == 0 ? lightTheme
          .scaffoldBackgroundColor : darkTheme.scaffoldBackgroundColor;
      Color textColor = themeMode == 0 ? Colors.black : Colors.white;
      return Container(
        padding: const EdgeInsets.all(20),
        height: 287,
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
            Text(
              'Transportation',
              style: TextStyle(
                color: textColor,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Transportation',
                        style: TextStyle(
                          color: textColor,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 5.0),
                      SizedBox(
                        width: 125,
                        height: 42,
                        child: TextField(
                          controller: _transportationController,
                          style: const TextStyle(color: Color(0xFF46A291)),
                          decoration: InputDecoration(
                            fillColor: const Color(
                                0xFFF1F7F6),
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
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Type of Transportation',
                        style: TextStyle(
                          color: textColor,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 5.0),
                      SizedBox(
                        width: 125,
                        height: 42,
                        child: TextField(
                          controller: _transportationTypeController,
                          style: const TextStyle(color: Color(0xFF46A291)),
                          decoration: InputDecoration(
                            fillColor: const Color(0xFFF1F7F6),
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
                      ),
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.bottomRight,
                  padding: const EdgeInsets.only(top: 20),
                  child: MlIconButton(
                    size: 25,
                    tooltip: 'Delete',
                    padding: EdgeInsets.zero,
                    onTap: () {
                      setState(() {});
                    },
                    icon: Icons.delete_outline,
                    enabledColor: const Color(0xFFF75757),
                  ),
                )
              ],
            ),
            const SizedBox(height: 20.0),
            Container(
              height: 1,
              decoration: const BoxDecoration(
                color: Color(0xFF7EBEB2),
                shape: BoxShape.rectangle,
              ),
            ),
            const SizedBox(height: 20.0),
            GestureDetector(
              child: const Text(
                'Add extra Transportation infomation',
                style: TextStyle(
                  color: Color(0xFF237A6A),
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            Container(
              height: 1,
              decoration: const BoxDecoration(
                color: Color(0xFF7EBEB2),
                shape: BoxShape.rectangle,
              ),
            ),
            const SizedBox(height: 20.0),
            GestureDetector(
              onTap: () async {
                setState(() {
                  _activeSubPageIdx = 0;
                });
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
                child: Text(
                  'Save',
                  style: TextStyle(
                    color: textColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }

  Widget buildDependents() {
    var curSelect='';
    return Consumer(builder: (context, ref, child)
    {
      final themeMode = sendData.theme;
      Color backgroundColor = themeMode == 0 ? lightTheme
          .scaffoldBackgroundColor : darkTheme.scaffoldBackgroundColor;
      Color textColor = themeMode == 0 ? Colors.black : Colors.white;
      return Container(
        padding: const EdgeInsets.all(20),
        height: 210,
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
            Text(
              'Dependents',
              style: TextStyle(
                color: textColor,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 20.0),
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                curSelect,
                style: TextStyle(
                  color: textColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(height: 5.0),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              height: 42,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(color: const Color(0xFF237A6A)),
                color: const Color(0xFFF1F7F6),
              ),
              alignment: Alignment.center,
              child: DropdownButton<String>(
                value: curSelect,
                style: const TextStyle(color: Color(0xFF46A291)),
                isExpanded: true,
                dropdownColor: const Color(0xFFF1F7F6),
                onChanged: (newValue) { curSelect = newValue!; },
                underline: Container(),
                icon: const Icon(
                  Icons.keyboard_arrow_down,
                  color: Color(0xFF46A291),
                ),
                items: <String>['0 dependents', '1 dependents', '2 dependents']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 20.0),
            GestureDetector(
              onTap: () async {
                setState(() {
                  _activeSubPageIdx = 0;
                  
                });
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
                child: Text(
                  'Save',
                  style: TextStyle(
                    color: textColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }

  Widget buildAddress() {
    return Consumer(builder: (context, ref, child)
    {
      final themeMode = sendData.theme;
      Color backgroundColor = themeMode == 0 ? lightTheme
          .scaffoldBackgroundColor : darkTheme.scaffoldBackgroundColor;
      Color textColor = themeMode == 0 ? Colors.black : Colors.white;
      return Container(
        padding: const EdgeInsets.all(20),
        height: 375,
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
            Text(
              'Address',
              style: TextStyle(
                color: textColor,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 20.0),
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                'Street address',
                style: TextStyle(
                  color: textColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(height: 5.0),
            SizedBox(
              height: 42,
              child: TextField(
                controller: _addressController,
                style: const TextStyle(
                  color: Color(0xFF237A6A),
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
                decoration: InputDecoration(
                  fillColor: const Color(0xFFF1F7F6),
                  filled: true,
                  contentPadding:
                  const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color(0xFF7EBEB2)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Color(0xFF7EBEB2))),
                  focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xFF7EBEB2)),
                      borderRadius: BorderRadius.circular(10)),
                ),
                onChanged: (value) {},
                textAlign: TextAlign.start,
              ),
            ),
            const SizedBox(height: 20.0),
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                'ZIP code',
                style: TextStyle(
                  color: textColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(height: 5.0),
            SizedBox(
              height: 42,
              child: TextField(
                controller: _zipCodeController,
                style: const TextStyle(
                  color: Color(0xFF237A6A),
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
                decoration: InputDecoration(
                  fillColor: const Color(0xFFF1F7F6),
                  filled: true,
                  contentPadding:
                  const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color(0xFF7EBEB2)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Color(0xFF7EBEB2))),
                  focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xFF7EBEB2)),
                      borderRadius: BorderRadius.circular(10)),
                ),
                onChanged: (value) {},
                textAlign: TextAlign.start,
              ),
            ),
            const SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'City',
                        style: TextStyle(
                          color: textColor,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 5.0),
                      SizedBox(
                        width: 145,
                        height: 41,
                        child: TextField(
                          controller: _cityCodeController,
                          style: TextStyle(
                            color: textColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                          decoration: InputDecoration(
                            fillColor: const Color(0xFFE5F0EE),
                            filled: true,
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 15),
                            border: OutlineInputBorder(
                              borderSide:
                              const BorderSide(color: Color(0xFFF1F7F6)),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                const BorderSide(color: Color(0xFFF1F7F6))),
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                const BorderSide(color: Color(0xFFF1F7F6)),
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          onChanged: (value) {},
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Container(
                        alignment: Alignment.bottomLeft,
                        padding: const EdgeInsets.only(left: 8),
                        child: Text(
                          'State',
                          style: TextStyle(
                            color: textColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      const SizedBox(height: 5.0),
                      SizedBox(
                        width: 145,
                        height: 41,
                        child: TextField(
                          controller: _stateCodeController,
                          style: TextStyle(
                            color: textColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                          decoration: InputDecoration(
                            fillColor: const Color(0xFFE5F0EE),
                            filled: true,
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 15),
                            border: OutlineInputBorder(
                              borderSide:
                              const BorderSide(color: Color(0xFFF1F7F6)),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                const BorderSide(color: Color(0xFFF1F7F6))),
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                const BorderSide(color: Color(0xFFF1F7F6)),
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          onChanged: (value) {},
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            GestureDetector(
              onTap: () async {
                setState(() {
                  _activeSubPageIdx = 0;
                });
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
                child: Text(
                  'Save',
                  style: TextStyle(
                    color: textColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }

  Widget buildPets() {
    return Consumer(builder: (context, ref, child)
    {
      final themeMode = sendData.theme;
      Color backgroundColor = themeMode == 0 ? lightTheme
          .scaffoldBackgroundColor : darkTheme.scaffoldBackgroundColor;
      Color textColor = themeMode == 0 ? Colors.black : Colors.white;
      return Container(
        padding: const EdgeInsets.all(20),
        height: 287,
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
            Text(
              'Pets',
              style: TextStyle(
                color: textColor,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Pet type',
                      style: TextStyle(
                        color: textColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 5.0),
                    SizedBox(
                      width: 160,
                      height: 42,
                      child: TextField(
                        controller: _petsController,
                        style: const TextStyle(color: Color(0xFF46A291)),
                        decoration: InputDecoration(
                          fillColor: const Color(
                              0xFFF1F7F6),
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
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Number of pets',
                      style: TextStyle(
                        color: textColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 5.0),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      height: 42,
                      width: 90,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(color: const Color(0xFF237A6A)),
                        color: const Color(0xFFF1F7F6),
                      ),
                      alignment: Alignment.center,
                      child: DropdownButton<String>(
                        value: '0',
                        style: const TextStyle(color: Color(0xFF46A291)),
                        isExpanded: true,
                        dropdownColor: const Color(0xFFF1F7F6),
                        onChanged: (newValue) {},
                        underline: Container(),
                        icon: const Icon(
                          Icons.keyboard_arrow_down,
                          color: Color(0xFF46A291),
                        ),
                        items: <String>['0', '1', '2']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
                Container(
                  alignment: Alignment.bottomRight,
                  padding: const EdgeInsets.only(top: 20),
                  child: MlIconButton(
                    size: 25,
                    tooltip: 'Delete',
                    padding: EdgeInsets.zero,
                    onTap: () {
                      setState(() {});
                    },
                    icon: Icons.delete_outline,
                    enabledColor: const Color(0xFFF75757),
                  ),
                )
              ],
            ),
            const SizedBox(height: 20.0),
            Container(
              height: 1,
              decoration: const BoxDecoration(
                color: Color(0xFF7EBEB2),
                shape: BoxShape.rectangle,
              ),
            ),
            const SizedBox(height: 20.0),
            GestureDetector(
              child: const Text(
                'Add additional pet',
                style: TextStyle(
                  color: Color(0xFF237A6A),
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            Container(
              height: 1,
              decoration: const BoxDecoration(
                color: Color(0xFF7EBEB2),
                shape: BoxShape.rectangle,
              ),
            ),
            const SizedBox(height: 20.0),
            GestureDetector(
              onTap: () async {
                setState(() {
                  _activeSubPageIdx = 0;
                });
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
                child: Text(
                  'Save',
                  style: TextStyle(
                    color: textColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }

  Widget buildInternetSpeed() {
    return Consumer(builder: (context, ref, child)
    {
      final themeMode = sendData.theme;
      Color backgroundColor = themeMode == 0 ? lightTheme
          .scaffoldBackgroundColor : darkTheme.scaffoldBackgroundColor;
      Color textColor = themeMode == 0 ? Colors.black : Colors.white;
      return Container(
        padding: const EdgeInsets.all(20),
        height: 210,
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
            Text(
              'Internet speed',
              style: TextStyle(
                color: textColor,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 20.0),
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                'Select your internet speed',
                style: TextStyle(
                  color: textColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(height: 5.0),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              height: 42,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(color: const Color(0xFF237A6A)),
                color: const Color(0xFFF1F7F6),
              ),
              alignment: Alignment.center,
              child: DropdownButton<String>(
                value: 'Slow- 1Mbps to 5Mbps',
                style: const TextStyle(color: Color(0xFF46A291)),
                isExpanded: true,
                dropdownColor: const Color(0xFFF1F7F6),
                onChanged: (newValue) {},
                underline: Container(),
                icon: const Icon(
                  Icons.keyboard_arrow_down,
                  color: Color(0xFF46A291),
                ),
                items: <String>[
                  'Slow- 1Mbps to 5Mbps',
                  'Normal- 7Mbps to 11Mbps',
                  'Fast- more than 12Mbps',
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 20.0),
            GestureDetector(
              onTap: () async {
                setState(() {
                  _activeSubPageIdx = 0;
                });
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
                child: Text(
                  'Save',
                  style: TextStyle(
                    color: textColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }

  Widget buildHobbies() {
    return Consumer(builder: (context, ref, child)
    {
      final themeMode = sendData.theme;
      Color backgroundColor = themeMode == 0 ? lightTheme
          .scaffoldBackgroundColor : darkTheme.scaffoldBackgroundColor;
      Color textColor = themeMode == 0 ? Colors.black : Colors.white;
      return Container(
        padding: const EdgeInsets.all(20),
        height: 287,
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
            Text(
              'Hobbies',
              style: TextStyle(
                color: textColor,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Hobby description',
                      style: TextStyle(
                        color: textColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 5.0),
                    SizedBox(
                      width: 160,
                      height: 42,
                      child: TextField(
                        controller: _hobbiesController,
                        style: const TextStyle(color: Color(0xFF46A291)),
                        decoration: InputDecoration(
                          fillColor: const Color(
                              0xFFF1F7F6),
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
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Hours pr. week',
                      style: TextStyle(
                        color: textColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 5.0),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      height: 42,
                      width: 90,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(color: const Color(0xFF237A6A)),
                        color: const Color(0xFFF1F7F6),
                      ),
                      alignment: Alignment.center,
                      child: DropdownButton<String>(
                        value: '0',
                        style: const TextStyle(color: Color(0xFF46A291)),
                        isExpanded: true,
                        dropdownColor: const Color(0xFFF1F7F6),
                        onChanged: (newValue) {},
                        underline: Container(),
                        icon: const Icon(
                          Icons.keyboard_arrow_down,
                          color: Color(0xFF46A291),
                        ),
                        items: <String>['0', '1', '2']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
                Container(
                  alignment: Alignment.bottomRight,
                  padding: const EdgeInsets.only(top: 20),
                  child: MlIconButton(
                    size: 25,
                    tooltip: 'Delete',
                    padding: EdgeInsets.zero,
                    onTap: () {
                      setState(() {});
                    },
                    icon: Icons.delete_outline,
                    enabledColor: const Color(0xFFF75757),
                  ),
                )
              ],
            ),
            const SizedBox(height: 20.0),
            Container(
              height: 1,
              decoration: const BoxDecoration(
                color: Color(0xFF7EBEB2),
                shape: BoxShape.rectangle,
              ),
            ),
            const SizedBox(height: 20.0),
            GestureDetector(
              child: const Text(
                'Add additional hobby',
                style: TextStyle(
                  color: Color(0xFF237A6A),
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            Container(
              height: 1,
              decoration: const BoxDecoration(
                color: Color(0xFF7EBEB2),
                shape: BoxShape.rectangle,
              ),
            ),
            const SizedBox(height: 20.0),
            GestureDetector(
              onTap: () async {
                setState(() {
                  _activeSubPageIdx = 0;
                });
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
                child: Text(
                  'Save',
                  style: TextStyle(
                    color: textColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }

  Widget buildSleepSchedule() {
    return Consumer(builder: (context, ref, child)
    {
      final themeMode = sendData.theme;
      Color backgroundColor = themeMode == 0 ? lightTheme
          .scaffoldBackgroundColor : darkTheme.scaffoldBackgroundColor;
      Color textColor = themeMode == 0 ? Colors.black : Colors.white;
      return Container(
        padding: const EdgeInsets.all(20),
        height: 210,
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
            Text(
              'Sleep schedule',
              style: TextStyle(
                color: textColor,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Sleep time',
                      style: TextStyle(
                        color: textColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 5.0),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      height: 42,
                      width: 145,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(color: const Color(0xFF237A6A)),
                        color: const Color(0xFFF1F7F6),
                      ),
                      alignment: Alignment.center,
                      child: DropdownButton<String>(
                        value: '22:00',
                        style: const TextStyle(color: Color(0xFF46A291)),
                        isExpanded: true,
                        dropdownColor: const Color(0xFFF1F7F6),
                        onChanged: (newValue) {},
                        underline: Container(),
                        icon: const Icon(
                          Icons.keyboard_arrow_down,
                          color: Color(0xFF46A291),
                        ),
                        items: <String>['22:00', '21:00', '20:00']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Wake up time',
                      style: TextStyle(
                        color: textColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 5.0),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      height: 42,
                      width: 145,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(color: const Color(0xFF237A6A)),
                        color: const Color(0xFFF1F7F6),
                      ),
                      alignment: Alignment.center,
                      child: DropdownButton<String>(
                        value: '06:00',
                        style: const TextStyle(color: Color(0xFF46A291)),
                        isExpanded: true,
                        dropdownColor: const Color(0xFFF1F7F6),
                        onChanged: (newValue) {},
                        underline: Container(),
                        icon: const Icon(
                          Icons.keyboard_arrow_down,
                          color: Color(0xFF46A291),
                        ),
                        items: <String>['06:00', '07:00', '08:00']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            GestureDetector(
              onTap: () async {
                setState(() {
                  _activeSubPageIdx = 0;
                });
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
                child: Text(
                  'Save',
                  style: TextStyle(
                    color: textColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
